import 'package:flutter/material.dart';
import '../../model/orders.dart';
import '../../widgets/bidder_list_item.dart';
import '../model/bidder.dart';

class OrderListItem extends StatelessWidget {
  final Order order;
  final int orderIndex;
  final Function(int, int) onSelectBidder;

  OrderListItem({
    required this.order,
    required this.orderIndex,
    required this.onSelectBidder,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                order.imageUrl,
                height: 150.0,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 10.0),
            Text(
              '${order.productName}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'MSP Price: ₹${order.mspPrice.toStringAsFixed(2)}',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.orange.shade700,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'Bidders:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              children: order.bidders.asMap().entries.map((entry) {
                int bidderIndex = entry.key;
                Bidder bidder = entry.value;

                return BidderListItem(
                  bidder: bidder,
                  isSelected: order.selectedBidderIndex == bidderIndex,
                  onBidderSelected: () {
                    _showBidderSelectionDialog(context, bidder, bidderIndex);
                  },
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  void _showBidderSelectionDialog(BuildContext context, Bidder bidder, int bidderIndex) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Confirm Selection'),
        content: Text('Are you sure you want to select ${bidder.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.red,
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              onSelectBidder(orderIndex, bidderIndex);
            },
            child: Text('Confirm'),
            style: TextButton.styleFrom(
              foregroundColor: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}
