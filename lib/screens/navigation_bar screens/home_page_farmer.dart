import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:krishi_connect/screens/product_farmer.dart';
import 'package:krishi_connect/widgets/search.dart';

import '../../model/product.dart';

class HomePageFarmer extends StatelessWidget {
  List<Product> products = [
    Product(
      name: 'Wheat',
      category: 'Grains',
      region: 'Punjab',
      quality: 'A+',
      quantity: 1000,
      status: 'Listed',
      estimatedPrice: 1500.00,
      msp: 2000.00,
      storageOption: 'Self',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/wheat.png',
      farmerName: 'Priyanshu',
    ),
    Product(
      name: 'Strawberry',
      category: 'Fruits',
      region: 'Jharkhand',
      quality: 'C',
      quantity: 100,
      msp: 200.00,
      status: 'Pending',
      estimatedPrice: 100.00,
      storageOption: 'Cold Storage',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/strawberries.png',
      farmerName: 'Aditya',
    ),
    Product(
      name: 'Tulsi',
      category: 'Herbs',
      region: 'Haryana',
      quality: 'A',
      quantity: 500,
      status: 'Verified',
      estimatedPrice: 2000.00,
      msp: 5000.00,
      storageOption: 'Warehouse',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/tulsi.png',
      farmerName: 'Anisha',
    ),
    Product(
      name: 'Rice',
      category: 'Grains',
      region: 'Haryana',
      quality: 'A',
      quantity: 500,
      status: 'Verified',
      estimatedPrice: 2000.00,
      msp: 5000.00,
      storageOption: 'Warehouse',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/rice.png',
      farmerName: 'Uddeshya',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchWidget(),
          Expanded(
            child: ProductFarmerListItem(products: products),
          ),
        ],
      ),
    );
  }
}
