import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/fonts.dart';

class CustomPage extends StatelessWidget {
  const CustomPage({
    super.key,
    required this.text,
    required this.subtext,
    required this.image,
  });
  final String text;
  final String subtext;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 30.h),
            Text(
              text, //"Latest\nCosmetics\nEvery Day",
              style: AppFont.text28,
              textAlign: TextAlign.center,
            ),

            SizedBox(height: 10.h),
            Text(
              textAlign: TextAlign.center,
              subtext, // "various types of make up latest and \ntrendy especially for you",
              style: AppFont.text12,
            ),
            Image.asset(
              image, //  "assets/images/mescara.png",
              height: 300.h,
              width: 300.w,
            ),
          ],
        ),
      ),
    );
  }
}
