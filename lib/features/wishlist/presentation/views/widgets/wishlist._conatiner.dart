import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/provider/cart.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:provider/provider.dart';

class WishListContainer extends StatelessWidget {
  const WishListContainer({super.key, required this.product, this.onTap});
  final ProductModel product;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 12.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: ColorsApp.white,
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 6, offset: Offset(0, 3)),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          /// Product Image
          ClipRRect(
            borderRadius: BorderRadius.circular(12.r),
            child: Image.network(
              product.imageLink,
              height: 80.h,
              width: 80.w,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 80.h,
                  width: 80.w,
                  color: Colors.grey[300],
                  child: Icon(
                    Icons.broken_image,
                    size: 50.sp,
                    color: ColorsApp.bottonColor,
                  ),
                );
              },
            ),
          ),
          SizedBox(width: 12.w),

          /// Product Details
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(product.name, style: AppFont.text14),

                Text(product.brand, style: AppFont.text12),
                SizedBox(height: 5.h),
                Text(
                  product.price,
                  style: AppFont.text12.copyWith(
                    color: ColorsApp.pink,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8.h),
              ],
            ),
          ),

          /// Delete Icon
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: onTap,
                icon: Icon(
                  Icons.delete_outline,
                  size: 28,
                  color: Colors.redAccent,
                ),
              ),
              SizedBox(height: 5.h),
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return IconButton(
                    onPressed: () {
                      cart.add(product);
                    },
                    icon: Icon(
                      Icons.shopping_cart_checkout_rounded,
                      size: 28,
                      color: ColorsApp.bottonColor,
                    ),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
