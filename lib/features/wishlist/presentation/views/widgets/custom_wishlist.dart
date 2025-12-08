import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/provider/wishlist.dart';
import 'package:glow_me/features/wishlist/presentation/views/widgets/wishlist._conatiner.dart';
import 'package:provider/provider.dart';

class CustomWishlist extends StatelessWidget {
  const CustomWishlist({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Wishlist>(
      builder: (context, list, child) {
        if (list.wishlist.isEmpty) {
          return SizedBox(
            height: 500.h,
            child: Center(
              child: Text("Your wishlist is empty ", style: AppFont.text16),
            ),
          );
        }
        return ListView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          itemCount: list.wishlist.length,
          itemBuilder: (context, index) {
            return WishListContainer(
              product: list.wishlist[index],
              onTap: () => list.remove(list.wishlist[index]),
            );
          },
        );
      },
    );
  }
}
