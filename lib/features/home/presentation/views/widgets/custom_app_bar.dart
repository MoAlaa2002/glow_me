import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/features/home/presentation/views/my_cart_screen.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 140.w),
              child: Text(
                "GlowMe",
                style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
              ),
            ),
            SizedBox(width: 90.w),
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) {
                      return MyCartScreen();
                    },
                  ),
                );
              },
              icon: Icon(
                Icons.shopping_cart,
                color: ColorsApp.bottonColor,
                size: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
