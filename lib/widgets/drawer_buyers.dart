import 'package:flutter/material.dart';
import 'package:krishi_connect/screens/navigation_bar%20screens/bidders_page_farmer.dart';
import 'package:krishi_connect/screens/navigation_bar%20screens/orders_page_farmer.dart';

import '../screens/bidders_page_buyer.dart';
import '../screens/orders_page_buyer.dart';

class CustomDrawerBuyer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.green,
            ),
            child: Image.asset(
              'assets/images/app_logo.png',
              width: 100,
              height: 100,
            ),
          ),
          ListTile(
            leading: Icon(Icons.dashboard),
            title: Text('Dashboard'),
            onTap: () {
              // Add navigation to Dashboard page
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.shopping_bag),
            title: Text('My Orders'),
            onTap: () {
              // Add navigation to My Orders page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => OrdersPageBuyer(),
                ),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.gavel),
            title: Text('My Bids'),
            onTap: () {
              // Add navigation to My Bids page
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => BiddersPageBuyer(),
                ),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Add logout functionality
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
