import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    required this.text,
    required this.ontap,
  });
  final double width;
  final double height;
  final Color color;
  final String text;
  final void Function()? ontap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Center(
          child: Text(
            text,
            style: AppFont.text18.copyWith(
              fontWeight: FontWeight.bold,
              color: ColorsApp.white,
            ),
          ),
        ),
      ),
    );
  }
}
