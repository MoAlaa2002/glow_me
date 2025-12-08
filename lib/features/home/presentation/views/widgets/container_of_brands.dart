import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

class ContainerOfBrands extends StatelessWidget {
  final String image;
  final String name;

  const ContainerOfBrands({super.key, required this.image, required this.name});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20.r),
        color: ColorsApp.white,
        border: Border.all(color: Colors.grey[300]!, width: 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          /// Circle Image
          ClipOval(
            child: Image.asset(
              image,
              width: 70.w,
              height: 70.h,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(height: 10.h),

          /// Brand Name
          Text(
            name,
            style: AppFont.text14.copyWith(
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }
}
