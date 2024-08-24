import 'package:flutter/material.dart';
import '../model/bidder.dart';

class BidderListItem extends StatelessWidget {
  final Bidder bidder;
  final bool isSelected;
  final VoidCallback onBidderSelected;

  BidderListItem({
    required this.bidder,
    required this.isSelected,
    required this.onBidderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              bidder.name,
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Icon(
                  Icons.location_on,
                  color: Colors.redAccent,
                ),
                SizedBox(width: 5.0),
                Text(
                  bidder.region,
                  style: TextStyle(fontSize: 14.0),
                ),
                Spacer(),
                Icon(
                  Icons.scale,
                  color: Colors.blue,
                ),
                SizedBox(width: 5.0),
                Text(
                  '${bidder.quantity} ${bidder.quantity_unit}',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Text(
                  'Price/Unit: ₹${bidder.pricePerUnit.toStringAsFixed(2)}',
                  style: TextStyle(fontSize: 14.0),
                ),
                Spacer(),
                if (!isSelected)
                  ElevatedButton.icon(
                    onPressed: onBidderSelected,
                    icon: Icon(
                      Icons.check_circle_outline,
                      color: Colors.green,
                    ),
                    label: Text(
                      'Select',
                      style: TextStyle(color: Colors.green),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: Colors.green,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
                if (isSelected)
                  ElevatedButton.icon(
                    onPressed: onBidderSelected,
                    icon: Icon(
                      Icons.check_circle_outline,
                      color: Colors.white,
                    ),
                    label: Text(
                      'Selected',
                      style: TextStyle(color: Colors.white),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
                    ),
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
