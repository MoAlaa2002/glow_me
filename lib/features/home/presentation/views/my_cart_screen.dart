import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/stripe_payment/payment_manger.dart';
import 'package:glow_me/core/utils/func/build_add_or_remove_to_cart.dart';
import 'package:glow_me/core/utils/provider/cart.dart';
import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:provider/provider.dart';

class MyCartScreen extends StatelessWidget {
  const MyCartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: Consumer<Cart>(
            builder: (context, cart, child) {
              double subtotal = cart.totalPrice;
              const String shippingCost = "notFree";
              double total = subtotal;

              if (shippingCost != 'Free') {
                try {
                  total += double.parse(shippingCost.replaceAll('\$', ''));
                } catch (_) {}
              }

              String totalDisplay = '\$${total.toStringAsFixed(2)}';
              return Column(
                children: [
                  SizedBox(height: 40.h),
                  CustomAppBar(title: "My Cart", width: 100),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: cart.productCart.length,
                    itemBuilder: (context, index) {
                      return _cartContainer(
                        product: cart.productCart.keys.toList()[index],
                        onTap: () {
                          Provider.of<Cart>(
                            context,
                            listen: false,
                          ).removeCompletely(
                            cart.productCart.keys.toList()[index],
                          );
                        },
                        quantity: cart.productCart.values.toList()[index],
                      );
                    },
                  ),

                  SizedBox(height: 20.h),

                  /// Order Summary
                  Container(
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(18.r),
                      color: Colors.grey[100],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Summary',
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                        SizedBox(height: 12.h),

                        _buildSummaryRow(
                          'Subtotal',
                          '\$${subtotal.toStringAsFixed(2)}',
                        ),
                        _buildSummaryRow('Shipping', shippingCost),
                        Divider(height: 20, thickness: 1),

                        _buildSummaryRow('Total', totalDisplay, isTotal: true),
                      ],
                    ),
                  ),

                  SizedBox(height: 20.h),

                  /// Checkout Button
                  CustomButton(
                    width: double.infinity.w,
                    height: 45.h,
                    color: ColorsApp.bottonColor,
                    text: "Proceed to Checkout",
                    ontap: () {
                      PaymentManger.makePayment(total, 'egp');
                    },
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

Widget _cartContainer({
  required ProductModel product,
  required final void Function()? onTap,
  required int quantity,
}) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 8.h),
    padding: EdgeInsets.all(10),
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

        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(product.name, style: AppFont.text14),
              SizedBox(height: 5.h),
              Text(
                product.price,
                style: AppFont.text12.copyWith(
                  color: ColorsApp.pink,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),

              /// Quantity Row
              Consumer<Cart>(
                builder: (context, cart, child) {
                  return Row(
                    children: [
                      buildAddorRemoveToCart("+", () => cart.add(product)),
                      SizedBox(width: 10.w),
                      Text(
                        cart.productCart[product]?.toString() ?? '1',
                        style: AppFont.text14.copyWith(color: ColorsApp.pink),
                      ),
                      SizedBox(width: 10.w),
                      buildAddorRemoveToCart("-", () => cart.remove(product)),
                    ],
                  );
                },
              ),
            ],
          ),
        ),

        /// Delete Icon
        IconButton(
          onPressed: onTap,
          icon: Icon(Icons.delete_outline, size: 28, color: Colors.redAccent),
        ),
      ],
    ),
  );
}

Widget _buildSummaryRow(String title, String value, {bool isTotal = false}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 4.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontSize: isTotal ? 16.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
            color: isTotal ? ColorsApp.pink : Colors.grey[700],
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontSize: isTotal ? 16.sp : 14.sp,
            fontWeight: isTotal ? FontWeight.bold : FontWeight.w400,
            color: isTotal ? ColorsApp.pink : Colors.grey[700],
          ),
        ),
      ],
    ),
  );
}
