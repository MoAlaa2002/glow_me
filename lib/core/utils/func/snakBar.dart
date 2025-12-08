import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

snackBar({required String msg, required BuildContext context}) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      backgroundColor: ColorsApp.darkpink,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      content: Center(
        child: Text(
          msg,
          style: AppFont.text12.copyWith(color: ColorsApp.white),
        ),
      ),
    ),
  );
}
