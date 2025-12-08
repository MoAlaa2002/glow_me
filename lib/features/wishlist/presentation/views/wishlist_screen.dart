import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/features/wishlist/presentation/views/widgets/custom_wishlist.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 50.h),
            Text(
              "Wishlist",
              style: AppFont.text18.copyWith(color: ColorsApp.primaryColor),
            ),

            CustomWishlist(),
          ],
        ),
      ),
    );
  }
}
