import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCarousleSlider extends StatelessWidget {
  const CustomCarousleSlider({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> carouselImages = [
      "assets/images/banner1.png",
      "assets/images/banner2.png",
      "assets/images/banner3.png",
      "assets/images/banner4.png",
      "assets/images/banner5.png",
    ];
    return SliverToBoxAdapter(
      child: CarouselSlider.builder(
        itemCount: carouselImages.length,
        itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.r),
                image: DecorationImage(
                  image: AssetImage(carouselImages[itemIndex]),
                ),
              ),
            ),
        options: CarouselOptions(
          height: 150,
          aspectRatio: 16 / 9,
          viewportFraction: 0.8,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: Duration(seconds: 3),
          autoPlayAnimationDuration: Duration(milliseconds: 800),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          enlargeFactor: 0.3,
          onPageChanged: (index, reson) {},
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }
}
