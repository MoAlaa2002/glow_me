import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/func/product_container.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/home/presentation/views/all_products_screen.dart';

import 'package:glow_me/features/home/presentation/views/product_details_screen.dart';

class CustomTrendingList extends StatelessWidget {
  const CustomTrendingList({super.key, required this.product});
  final List<ProductModel> product;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: EdgeInsets.only(top: 10.0.h),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 8.0.w),
                  child: Text(
                    "Trending Now",
                    style: AppFont.text18.copyWith(
                      color: ColorsApp.bottonColor,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) {
                          return AllProductsScreen(product: product);
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
            SizedBox(
              height: 200.h,
              child: listProduct(product: product),
            ),
          ],
        ),
      ),
    );
  }
}

Widget listProduct({required List<ProductModel> product}) {
  return ListView.builder(
    shrinkWrap: true,
    scrollDirection: Axis.horizontal,
    itemCount: product.length,
    itemBuilder: (context, index) {
      final item = product[index];
      return productContainer(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return ProductDetailsScreen(product: item);
              },
            ),
          );
        },
        image: item.imageLink,
        name: item.name,
        price: "${item.price}${item.priceSign}",
      );
    },
  );
}
