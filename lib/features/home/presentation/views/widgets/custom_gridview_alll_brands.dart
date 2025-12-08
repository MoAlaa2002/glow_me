import 'package:flutter/material.dart';
import 'package:glow_me/core/utils/func/product_container.dart';
import 'package:glow_me/features/home/data/model/product_model.dart';
import 'package:glow_me/features/home/presentation/views/product_details_screen.dart';

class CustomGridViewAllBrands extends StatelessWidget {
  const CustomGridViewAllBrands({super.key, required this.product});
  final List<ProductModel> product;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.all(8),
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 12,
        mainAxisSpacing: 13,
        childAspectRatio: 0.9,
      ),
      itemCount: product.length,
      itemBuilder: (context, index) {
        final item = product[index];
        final delay = Duration(milliseconds: 100 * index);
        return TweenAnimationBuilder<double>(
          tween: Tween(begin: 0, end: 1),
          duration: const Duration(milliseconds: 600),
          curve: Curves.easeOutBack,
          builder: (context, value, child) {
            final opacity = value.clamp(0.0, 1.0);
            return Opacity(
              opacity: opacity,
              child: Transform.scale(scale: value, child: child),
            );
          },
          child: FutureBuilder(
            future: Future.delayed(delay),
            builder: (context, snapshot) {
              if (snapshot.connectionState != ConnectionState.done) {
                return const SizedBox.shrink();
              }
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
          ),
        );
      },
    );
  }
}
