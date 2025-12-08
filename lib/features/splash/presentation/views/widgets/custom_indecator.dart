import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({super.key, required this.isActive});
  final bool isActive;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      width: isActive ? 30.w : 10.w,
      height: 10.h,
      duration: Duration(milliseconds: 250),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.r),
        color: isActive ? ColorsApp.bottonColor : ColorsApp.grey,
      ),
    );
  }
}
