import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/func/build_add_or_remove_to_cart.dart';
import 'package:glow_me/core/utils/func/convert_color.dart';
import 'package:glow_me/core/utils/provider/cart.dart';
import 'package:glow_me/core/utils/provider/wishlist.dart';
import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/home/presentation/views/widgets/shimmer/product_details_shimmer.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key, required this.product});
  final ProductModel product;

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  int selectedIndex = 0;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1500), () {
      if (mounted) {
        setState(() {
          isLoading = false;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? ProductDetailsShimmer()
          : SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 40.h),
                  CustomAppBar(title: "Product Details", width: 60),
                  SizedBox(height: 10.h),
                  _buildImageProduct(widget.product.imageLink),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: Text(widget.product.brand, style: AppFont.text12),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, bottom: 10.h),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            widget.product.name,
                            style: AppFont.text24,
                            maxLines: 2,
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Consumer<Wishlist>(
                          builder: (context, wishlist, child) {
                            final isFav = wishlist.wishlist.contains(
                              widget.product,
                            );

                            return IconButton(
                              onPressed: () {
                                wishlist.toggleFavorite(widget.product);
                              },
                              icon: AnimatedSwitcher(
                                duration: Duration(milliseconds: 300),
                                transitionBuilder: (child, animation) {
                                  return ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  );
                                },
                                child: Icon(
                                  isFav
                                      ? Icons.favorite
                                      : Icons.favorite_outline_rounded,
                                  key: ValueKey(isFav),
                                  color: isFav
                                      ? ColorsApp.bottonColor
                                      : Colors.grey,
                                  size: 30,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: List.generate(
                              widget.product.tagList.length,
                              (index) => Padding(
                                padding: EdgeInsets.only(right: 8.w),
                                child: _buildTag(widget.product.tagList[index]),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 80.w),
                      Text(
                        "${widget.product.price}${widget.product.priceSign}",
                        style: AppFont.text22,
                      ),
                    ],
                  ),
                  SizedBox(height: 15.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      widget.product.description,
                      style: AppFont.text14.copyWith(color: Colors.black54),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: Text(
                      "Shade",
                      style: AppFont.text18.copyWith(color: ColorsApp.black),
                    ),
                  ),
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.product.productColors.length,
                      itemBuilder: (context, index) {
                        final isSelected = selectedIndex == index;
                        return GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedIndex = index;
                            });
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: AnimatedSwitcher(
                              duration: Duration(milliseconds: 300),
                              transitionBuilder: (child, animation) {
                                return FadeTransition(
                                  opacity: animation,
                                  child: ScaleTransition(
                                    scale: animation,
                                    child: child,
                                  ),
                                );
                              },
                              child: Container(
                                height: 45.h,
                                key: ValueKey(isSelected),
                                width: 45.w,
                                decoration: BoxDecoration(
                                  color: widget
                                      .product
                                      .productColors[index]
                                      .hexValue
                                      .toColor(),
                                  shape: BoxShape.circle,
                                  border: isSelected
                                      ? Border.all(
                                          color: ColorsApp.bottonColor,
                                          width: 3.w,
                                        )
                                      : null,
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.w, top: 10.h),
                    child: Text(
                      "Quantity",
                      style: AppFont.text18.copyWith(color: ColorsApp.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 5.h, left: 8.0.w),
                    child: Consumer<Cart>(
                      builder: (context, cart, child) {
                        final quantity = cart.productCart[widget.product] ?? 0;

                        return Row(
                          children: [
                            buildAddorRemoveToCart("+", () {
                              cart.add(widget.product);
                            }),
                            SizedBox(width: 10.w),
                            Text(quantity.toString(), style: AppFont.text22),

                            SizedBox(width: 10.w),

                            buildAddorRemoveToCart("-", () {
                              cart.add(widget.product);
                            }),
                          ],
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Consumer<Cart>(
                      builder: (context, cart, child) {
                        return CustomButton(
                          width: double.infinity.w,
                          height: 50.h,
                          color: ColorsApp.bottonColor,
                          text: "Add to Cart",
                          ontap: () {
                            cart.add(widget.product);
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
    );
  }
}

Widget _buildTag(String text) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
    decoration: BoxDecoration(
      color: Colors.grey[200],
      borderRadius: BorderRadius.circular(15),
    ),
    child: Center(
      child: Text(text, style: AppFont.text12.copyWith(color: ColorsApp.black)),
    ),
  );
}

Widget _buildImageProduct(String image) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10.w),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20.r),
      child: Image.network(
        image,
        height: 300.h,
        width: double.infinity,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            height: 300.h,
            width: double.infinity,
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
  );
}
