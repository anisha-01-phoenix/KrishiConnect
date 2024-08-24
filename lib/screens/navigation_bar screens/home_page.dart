import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:banner_carousel/banner_carousel.dart';
import 'package:krishi_connect/widgets/search.dart';

class HomePage extends StatelessWidget {
  List<BannerModel> listBanners = [
    BannerModel(id: "1", imagePath: 'assets/images/banner_1.png'),
    BannerModel(id: "2", imagePath: 'assets/images/banner_2.png'),
    BannerModel(id: "3", imagePath: 'assets/images/banner_3.png'),
    BannerModel(id: "4", imagePath: 'assets/images/banner_4.png'),
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
        ],
      ),
    );
  }
}
