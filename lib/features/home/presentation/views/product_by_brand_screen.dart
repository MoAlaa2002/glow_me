import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_gridview_alll_brands.dart';

class ProductByBrandScreen extends StatelessWidget {
  const ProductByBrandScreen({super.key, required this.product});
  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),

        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomAppBar(title: "Shop by Categories", width: 60),
              SizedBox(height: 15.h),

              SizedBox(height: 15.h),

              CustomGridViewAllBrands(product: product),
            ],
          ),
        ),
      ),
    );
  }
}
