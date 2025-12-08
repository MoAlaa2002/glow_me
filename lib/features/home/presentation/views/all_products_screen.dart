import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/core/widgets/custom_text_form_filed.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_gridview_alll_brands.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key, required this.product});
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
              CustomAppBar(title: "Shop by Brands", width: 60),
              SizedBox(height: 15.h),

              /// Search Bar
              CustomTextFormFiled(
                isHidden: false,
                label: "Search for a brand",
                icon: Icon(Icons.search_rounded, color: Colors.grey[600]),
              ),

              SizedBox(height: 15.h),

              /// Brands Grid
              CustomGridViewAllBrands(product: product),
            ],
          ),
        ),
      ),
    );
  }
}

// class ContainerOfBrands extends StatelessWidget {
//   const ContainerOfBrands({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 100.h,
//       width: 100.w,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(25.r),
//         color: ColorsApp.white,
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black26,
//             blurRadius: 8,
//             spreadRadius: 1,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Container(
//             height: 80.h,
//             width: 80.w,
//             decoration: BoxDecoration(
//               shape: BoxShape.circle,
//               image: DecorationImage(
//                 fit: BoxFit.cover,
//                 image: AssetImage("assets/brands/download-11.png"),
//               ),
//             ),
//           ),
//           Text("COVERGIRL", style: AppFont.text12),
//         ],
//       ),
//     );
//   }
// }
