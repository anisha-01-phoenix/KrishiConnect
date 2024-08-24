import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:krishi_connect/screens/product_farmer.dart';
import 'package:krishi_connect/widgets/search.dart';

import '../../model/product.dart';

class HomePageBuyer extends StatelessWidget {
  List<BannerModel> listBanners = [
    BannerModel(id: "1", imagePath: 'assets/images/banner_1.png'),
    BannerModel(id: "2", imagePath: 'assets/images/banner_2.png'),
    BannerModel(id: "3", imagePath: 'assets/images/banner_3.png'),
    BannerModel(id: "4", imagePath: 'assets/images/banner_4.png'),
  ];

  List<Product> products = [
    Product(
      name: 'Wheat',
      category: 'Grains',
      region: 'Punjab',
      quality: 'A+',
      quantity: 1000,
      status: 'Listed',
      estimatedPrice: 1500.00,
      storageOption: 'Cold Storage',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/wheat.png'
    ),
    Product(
      name: 'Rice',
      category: 'Grains',
      region: 'Haryana',
      quality: 'A',
      quantity: 500,
      status: 'Verified',
      estimatedPrice: 2000.00,
      storageOption: 'Warehouse',
      quantity_unit: 'kg',
      imageUrl: 'assets/images/rice.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SearchWidget(),
          BannerCarousel(
            banners: listBanners,
            customizedIndicators: IndicatorModel.animation(
                width: 20, height: 5, spaceBetween: 2, widthAnimation: 50),
            width: double.infinity,
            height: 200,
            activeColor: Colors.lightGreenAccent,
            disableColor: Colors.white,
            animation: true,
            borderRadius: 10,
            indicatorBottom: false,
          ),
          Expanded(
            child: ProductFarmerListItem(products: products),
          ),
        ],
      ),
    );
  }
}
