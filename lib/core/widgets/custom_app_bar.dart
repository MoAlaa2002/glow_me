import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key, required this.title, required this.width});
  final String title;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(
            Icons.arrow_back_ios_rounded,
            size: 35,
            color: ColorsApp.darkpink,
          ),
        ),
        SizedBox(width: width.w),
        Text(
          title,
          style: AppFont.text18.copyWith(color: ColorsApp.primaryColor),
        ),
      ],
    );
  }
}
