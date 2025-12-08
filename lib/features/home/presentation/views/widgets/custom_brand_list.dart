import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/features/home/data/model/brands_model.dart';
import 'package:glow_me/features/home/presentation/views/all_brands_screen.dart';

class CustomBrandList extends StatelessWidget {
  const CustomBrandList({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Shop by Brand",
                  style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return AllBrandsScreen();
                        },
                      ),
                    );
                  },
                  child: Text(
                    "See All",
                    style: AppFont.text14.copyWith(color: ColorsApp.grey),
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
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.r),
                    color: ColorsApp.grey200,
                  ),
                  child: Center(
                    child: Text(
                      allBrands[index].brandName,
                      textAlign: TextAlign.center,
                      style: AppFont.text12.copyWith(color: ColorsApp.black),
                    ),
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
    );
  }
}
