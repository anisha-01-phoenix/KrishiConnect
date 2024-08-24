import 'package:flutter/material.dart';
import '../../model/orders.dart';

class OrderListItemSingleBidder extends StatelessWidget {
  final Order order;

  OrderListItemSingleBidder({required this.order});

  @override
  Widget build(BuildContext context) {
    final bidder = order.bidders.first;

    return Card(
      margin: EdgeInsets.all(8.0),
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
              order.productName,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
            Text(
              'MSP Price: ₹${order.mspPrice.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0, color: Colors.orange.shade700),
            ),
            SizedBox(height: 16.0),
            Row(
              children: [
                Icon(Icons.location_on, color: Colors.red.shade300),
                SizedBox(width: 5.0),
                Text(bidder.region),
                Spacer(),
                Icon(Icons.production_quantity_limits, color: Colors.blue),
                SizedBox(width: 5.0),
                Text(
                  '${bidder.quantity} ${bidder.quantity_unit}',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(height: 8.0),
            Text(
              'Price/Unit: ₹${bidder.pricePerUnit.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
