import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppFont {
  static TextStyle text12 = GoogleFonts.merriweather(
    color: ColorsApp.grey,
    fontWeight: FontWeight.normal,
    fontSize: 12.sp,
  );
  static TextStyle text14 = GoogleFonts.merriweather(
    color: ColorsApp.black,
    fontWeight: FontWeight.bold,
    fontSize: 14.sp,
  );
  static TextStyle text16 = GoogleFonts.merriweather(
    color: ColorsApp.grey,
    fontWeight: FontWeight.normal,
    fontSize: 16.sp,
  );
  static TextStyle text18 = GoogleFonts.merriweather(
    color: ColorsApp.grey,
    fontWeight: FontWeight.normal,
    fontSize: 18.sp,
  );
  static TextStyle text22 = GoogleFonts.merriweather(
    color: ColorsApp.pink,
    fontWeight: FontWeight.normal,
    fontSize: 22.sp,
  );
  static TextStyle text24 = GoogleFonts.merriweather(
    color: ColorsApp.black,
    fontWeight: FontWeight.normal,
    fontSize: 24.sp,
  );
  static TextStyle text28 = GoogleFonts.merriweather(
    color: ColorsApp.black,
    fontWeight: FontWeight.bold,
    fontSize: 28.sp,
  );
}
