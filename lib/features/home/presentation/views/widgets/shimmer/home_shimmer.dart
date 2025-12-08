import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/widgets/product_container_shimmer.dart';
import 'package:shimmer/shimmer.dart';

class HomeShimmer extends StatelessWidget {
  const HomeShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: ColorsApp.grey300,
      highlightColor: ColorsApp.grey100,
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 150.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorsApp.white,
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Padding(
            padding: EdgeInsets.only(right: 230.w),
            child: Padding(
              padding: EdgeInsets.only(left: 8.0.w),
              child: Container(
                width: 120.w,
                height: 20.h,
                color: ColorsApp.white,
              ),
            ),
          ),
          SizedBox(
            height: 90.h,
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: 5,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 30.r,

                        backgroundColor: ColorsApp.white,
                      ),
                      SizedBox(height: 8.h),
                      Container(
                        height: 8.h,
                        width: 25.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: ColorsApp.white,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Container(
                        width: 120.w,
                        height: 20.h,
                        color: ColorsApp.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Container(
                        width: 60.w,
                        height: 15.h,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 8.h),
                GridView.builder(
                  padding: EdgeInsets.all(0),
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: 8,
                  itemBuilder: (context, index) {
                    return Container(
                      height: 5.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        color: ColorsApp.white,
                      ),
                    );
                  },
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.0.h),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0.w),
                      child: Container(
                        width: 120.w,
                        height: 20.h,
                        color: ColorsApp.white,
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 8.0.w),
                      child: Container(
                        width: 60.w,
                        height: 15.h,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  height: 200.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (_, __) => const ProductContainerShimmer(),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
