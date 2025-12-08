import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

Widget productContainer({
  required void Function()? onTap,
  required String image,
  required String name,
  required String price,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Padding(
      padding: EdgeInsets.symmetric(horizontal: 10.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,

        children: [
          Expanded(
            child: Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.r),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30.r),
                  topLeft: Radius.circular(30.r),
                ), //BorderRadius.circular(30.r),
                child: Image.network(
                  image,
                  fit: BoxFit.contain,
                  errorBuilder: (context, error, stackTrace) {
                    return SizedBox(
                      height: 100.h,
                      width: double.infinity,
                      child: Icon(
                        Icons.broken_image,
                        size: 50.sp,
                        color: ColorsApp.bottonColor,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),

          SizedBox(height: 3.h),
          Text(
            name,
            style: AppFont.text14.copyWith(color: ColorsApp.black),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 5.h),
          Text(
            price,
            // "${item.price}${item.priceSign}",
            style: AppFont.text12.copyWith(color: ColorsApp.grey),
          ),
        ],
      ),
    ),
  );
}
