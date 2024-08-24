import 'package:flutter/material.dart';
import '../../model/bidder.dart';
import '../../model/orders.dart';
import '../../widgets/order_list_final.dart';
import '../widgets/order_list_buyer.dart';

class OrdersPageBuyer extends StatelessWidget {
  final List<Order> orders = [
    Order(
      productName: 'Organic Strawberries',
      mspPrice: 120.00,
      bidders: [
        Bidder(
          name: 'John Doe',
          region: 'Delhi',
          quantity: 50,
          pricePerUnit: 115.00,
          quantity_unit: 'kg',
        ),
      ],
      imageUrl: 'assets/images/strawberries.png',
    ),
    Order(
      productName: 'Fresh Wheat',
      mspPrice: 80.00,
      bidders: [
        Bidder(
          name: 'Alice Johnson',
          region: 'Mumbai',
          quantity: 100,
          pricePerUnit: 75.00,
          quantity_unit: 'kg',
        ),
      ],
      imageUrl: 'assets/images/wheat.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orders'),
      ),
      body: ListView.builder(
        itemCount: orders.length,
        itemBuilder: (context, index) {
          final order = orders[index];
          return OrderListItemBuyer(order: order);
        },
      ),
    );
  }
}
