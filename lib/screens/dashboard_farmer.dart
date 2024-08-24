import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:krishi_connect/widgets/drawer_farmer.dart';

import 'navigation_bar screens/home_page_farmer.dart';
import 'navigation_bar screens/products_page_farmer.dart';
import 'navigation_bar screens/profile_page.dart';

class DashboardFarmer extends StatefulWidget {
  @override
  _DashboardFarmerState createState() => _DashboardFarmerState();
}

class _DashboardFarmerState extends State<DashboardFarmer> {
  int _currentIndex = 0;

  // Icons for the bottom navigation bar
  final List<IconData> _iconList = [
    Icons.home_rounded,
    Icons.add,
    Icons.person_rounded,
  ];

  // Labels for each icon
  final List<String> _labels = [
    'Home',
    'Add Product',
    'Profile',
  ];

  // Corresponding screens for each tab
  final List<Widget> _pages = [
    HomePageFarmer(),
    ProductsPageFarmer(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_labels[_currentIndex]), // Title of the app
      ),
      drawer: CustomDrawerFarmer(),
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
