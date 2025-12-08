import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';

class CustomProductsOfCategoriesList extends StatelessWidget {
  const CustomProductsOfCategoriesList({super.key, required this.product});
  final ProductModel product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(child: SizedBox(height: 40.h)),
          SliverToBoxAdapter(
            child: CustomAppBar(title: "Products", width: 90.w),
          ),
          SliverPadding(
            padding: EdgeInsets.all(12.w),
            sliver: SliverGrid(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: GestureDetector(
                        onTap: () {},
                        child: Container(
                          height: 150.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20.r),
                            image: const DecorationImage(
                              image: AssetImage(
                                "assets/images/brain-freeze_a_800x1200.png",
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 6.h),
                    Text(
                      "Lippie Pencil",
                      style: AppFont.text14.copyWith(color: ColorsApp.black),
                    ),
                    SizedBox(height: 4.h),
                    Text(
                      "20 LE",
                      style: AppFont.text12.copyWith(color: ColorsApp.grey),
                    ),
                  ],
                );
              }, childCount: 30),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12.w,
                mainAxisSpacing: 12.h,
                childAspectRatio: 0.75,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
