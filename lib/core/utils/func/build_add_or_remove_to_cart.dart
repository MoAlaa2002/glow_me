import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

Widget buildAddorRemoveToCart(String text, void Function()? ontap) {
  return GestureDetector(
    onTap: ontap,
    child: Container(
      height: 40.h,
      width: 40.w,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.grey[200],
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Text(
          text,
          style: AppFont.text16.copyWith(color: ColorsApp.black),
        ),
      ),
    ),
  );
}
