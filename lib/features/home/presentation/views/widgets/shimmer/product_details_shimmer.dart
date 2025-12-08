import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductDetailsShimmer extends StatelessWidget {
  const ProductDetailsShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10.w),
      child: Shimmer.fromColors(
        baseColor: ColorsApp.grey300,
        highlightColor: ColorsApp.grey100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 40.h),
            Container(width: 120.w, height: 25.h, color: ColorsApp.white),
            SizedBox(height: 15.h),
            Container(
              height: 300.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            SizedBox(height: 15.h),
            Container(width: 80.w, height: 15.h, color: ColorsApp.white),
            SizedBox(height: 10.h),
            Container(width: 200.w, height: 20.h, color: ColorsApp.white),
            SizedBox(height: 20.h),
            Container(
              width: double.infinity,
              height: 100.h,
              color: ColorsApp.white,
            ),
            SizedBox(height: 20.h),
            Container(width: 120.w, height: 20.h, color: ColorsApp.white),
            SizedBox(height: 10.h),
            Row(
              children: List.generate(
                5,
                (index) => Padding(
                  padding: EdgeInsets.only(right: 8.w),
                  child: Container(
                    height: 45.h,
                    width: 45.w,
                    decoration: const BoxDecoration(
                      color: ColorsApp.white,
                      shape: BoxShape.circle,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20.h),
            Container(width: 120.w, height: 20.h, color: ColorsApp.white),
            SizedBox(height: 10.h),
            Container(
              height: 50.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(15.r),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
