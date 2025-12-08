import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/features/home/presentation/views/widgets/shimmer/home_shimmer.dart';
import 'package:glow_me/features/home/presentation/controller/product/product_cubit.dart';
import 'package:glow_me/features/home/presentation/controller/product/product_state.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_brand_list.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_carousle_slider.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_product_list.dart';
import 'package:glow_me/features/home/presentation/views/widgets/cutsom_trending_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductCubit, ProductState>(
        builder: (context, state) {
          if (state is LoadingProductState) {
            return const Center(child: HomeShimmer());
          } else if (state is LoadedProductState) {
            final product = state.product;
            return CustomScrollView(
              slivers: [
                SliverToBoxAdapter(child: SizedBox(height: 40.h)),
                CustomAppBar(),
                CustomCarousleSlider(),
                CustomProductList(),
                CustomBrandList(),
                CustomTrendingList(product: product),
              ],
            );
          } else {
            return const Center(child: Text("Failed to load product"));
          }
        },
      ),
    );
  }
}
