import 'package:flutter/material.dart';

import '../../model/bidder.dart';
import '../../model/orders.dart';
import '../../widgets/order_list_item.dart';

class BiddersPageFarmer extends StatefulWidget {
  @override
  _BiddersPageFarmerState createState() => _BiddersPageFarmerState();
}

class _BiddersPageFarmerState extends State<BiddersPageFarmer> {
  List<Order> orders = [
    Order(
      productName: 'Organic Strawberries',
      mspPrice: 120.00,
      bidders: [
        Bidder(
            name: 'Anisha',
            quantity: 50,
            pricePerUnit: 115.00,
            quantity_unit: 'kg',
            region: 'Dhanbad'),
        Bidder(
            name: 'Priyanshu',
            region: 'Kolkata',
            quantity: 30,
            pricePerUnit: 118.00,
            quantity_unit: 'kg'),
      ],
      imageUrl: 'assets/images/strawberries.png',
    ),
    Order(
      productName: 'Fresh Wheat',
      mspPrice: 80.00,
      bidders: [
        Bidder(
            name: 'Tarun',
            region: 'Mumbai',
            quantity: 100,
            pricePerUnit: 75.00,
            quantity_unit: 'kg'),
        Bidder(
            name: 'Aditya',
            region: 'Delhi',
            quantity: 60,
            pricePerUnit: 78.00,
            quantity_unit: 'kg'),
        Bidder(
            name: 'Uddeshya',
            region: 'Kolkata',
            quantity: 30,
            pricePerUnit: 118.00,
            quantity_unit: 'kg'),
      ],
      imageUrl: 'assets/images/wheat.png',
    ),
  ];

  void _selectBidder(int orderIndex, int bidderIndex) {
    setState(() {
      orders[orderIndex].selectedBidderIndex = bidderIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bids Placed'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderListItem(
            order: orders[index],
            orderIndex: index,
            onSelectBidder: _selectBidder,
          );
        },
      ),
    );
  }
}
