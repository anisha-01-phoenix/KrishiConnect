import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_buyers.dart';
import 'navigation_bar screens/cart_page_buyer.dart';
import 'navigation_bar screens/home_page_buyer.dart';
import 'navigation_bar screens/profile_page.dart';
import 'navigation_bar screens/profile_page_buyer.dart';

class DashboardBuyer extends StatefulWidget {
  @override
  _DashboardBuyerState createState() => _DashboardBuyerState();
}

class _DashboardBuyerState extends State<DashboardBuyer> {
  int _currentIndex = 0;

  // Icons for the bottom navigation bar
  final List<IconData> _iconList = [
    Icons.home_rounded,
    Icons.shopping_cart,
    Icons.person_rounded,
  ];

  // Labels for each icon
  final List<String> _labels = [
    'Home',
    'Cart',
    'Profile',
  ];

  // Corresponding screens for each tab
  final List<Widget> _pages = [
    HomePageBuyer(),
    CartPageBuyer(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_labels[_currentIndex]), // Title of the app
      ),
      drawer: CustomDrawerBuyer(), // Custom drawer for buyers
      body: _pages[_currentIndex],
      bottomNavigationBar: AnimatedBottomNavigationBar.builder(
        itemCount: _iconList.length,
        tabBuilder: (int index, bool isActive) {
          final color = isActive ? Colors.green : Colors.grey;
          return Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _iconList[index],
                color: color,
              ),
              const SizedBox(height: 4),
              Text(
                _labels[index],
                style: TextStyle(
                  color: color,
                  fontSize: 12,
                ),
              ),
            ],
          );
        },
        activeIndex: _currentIndex,
        gapLocation: GapLocation.none, // Remove gap for floating action button
        notchSmoothness: NotchSmoothness.softEdge,
        leftCornerRadius: 12,
        rightCornerRadius: 12,
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the index on tap
          });
        },
      ),
    );
  }
}
