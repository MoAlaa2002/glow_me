import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

class ProductContainerShimmer extends StatelessWidget {
  const ProductContainerShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Shimmer.fromColors(
        baseColor: ColorsApp.grey300,
        highlightColor: ColorsApp.grey100,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 140.w,
              height: 130.h,
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(30.r),
              ),
            ),
            SizedBox(height: 8.h),

            Container(width: 100.w, height: 15.h, color: ColorsApp.white),
            SizedBox(height: 5.h),
            Container(width: 60.w, height: 12.h, color: Colors.white),
          ],
        ),
      ),
    );
  }
}
