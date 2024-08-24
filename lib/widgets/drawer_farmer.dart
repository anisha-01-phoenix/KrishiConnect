import 'package:flutter/material.dart';
import 'package:krishi_connect/screens/navigation_bar%20screens/bidders_page_farmer.dart';
import 'package:krishi_connect/screens/navigation_bar%20screens/orders_page_farmer.dart';

class CustomDrawerFarmer extends StatelessWidget {
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
            leading: Icon(Icons.nature_people_rounded),
            title: Text('Dashboard'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.spa_rounded),
            title: Text('My Orders'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OrdersPageFarmer()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.agriculture_rounded),
            title: Text('Bids'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => BiddersPageFarmer()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.history),
            title: Text('Trade History'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.warehouse_rounded),
            title: Text('Services'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.payment),
            title: Text('Bills'),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Logout'),
            onTap: () {
              // Handle logout tap
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
