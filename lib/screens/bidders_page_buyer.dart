import 'package:flutter/material.dart';
import '../model/bid.dart';

class BiddersPageBuyer extends StatelessWidget {
  List<Bid> bids = [
    Bid(
      productName: 'Organic Tomatoes',
      mspPrice: 50.0,
      bidPrice: 55.0,
      farmerName: 'John Doe',
      status: 'accepted',
    ),
    Bid(
      productName: 'Fresh Apples',
      mspPrice: 80.0,
      bidPrice: 75.0,
      farmerName: 'Jane Smith',
      status: 'rejected',
    ),
    Bid(
      productName: 'Whole Wheat Flour',
      mspPrice: 40.0,
      bidPrice: 42.0,
      farmerName: 'Michael Brown',
      status: 'accepted',
    ),
    Bid(
      productName: 'Green Bell Peppers',
      mspPrice: 60.0,
      bidPrice: 58.0,
      farmerName: 'Emily Davis',
      status: 'rejected',
    ),
    Bid(
      productName: 'Potatoes',
      mspPrice: 30.0,
      bidPrice: 32.0,
      farmerName: 'Sarah Johnson',
      status: 'accepted',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bids List'),
      ),
      body: ListView.builder(
        itemCount: bids.length,
        itemBuilder: (context, index) {
          final bid = bids[index];
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
                  Text(
                    bid.productName,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'MSP: ₹${bid.mspPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.orange.shade700,
                        ),
                      ),
                      Text(
                        'Bid: ₹${bid.bidPrice.toStringAsFixed(2)}',
                        style: TextStyle(
                          fontSize: 14.0,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Farmer: ${bid.farmerName}',
                    style: TextStyle(
                      fontSize: 14.0,
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Text(
                    'Status: ${bid.status.toUpperCase()}',
                    style: TextStyle(
                      color: bid.status == 'accepted' ? Colors.green : Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
