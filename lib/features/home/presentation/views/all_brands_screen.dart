import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/features/home/data/model/brands_model.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_cubit.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_state.dart';
import 'package:glow_me/features/home/presentation/views/product_by_brand_screen.dart';
import 'package:glow_me/features/home/presentation/views/widgets/custom_brand_container.dart';

class AllBrandsScreen extends StatelessWidget {
  const AllBrandsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<TypeOfProductCubit, TypeOfProductState>(
        listenWhen: (previous, current) => previous != current,

        listener: (context, state) {
          if (state is LoadedTypeOfProductState) {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => ProductByBrandScreen(product: state.list),
              ),
            );
          } else if (state is FailureTypeOfProductState) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.errormsg)));
          }
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
            child: Column(
              children: [
                SizedBox(height: 40.h),
                CustomAppBar(title: "AllBrands", width: 70.w),

                GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 15.w,
                    mainAxisSpacing: 15.h,
                    childAspectRatio: 1,
                  ),
                  itemCount: allBrands.length,
                  itemBuilder: (context, index) {
                    final brand = allBrands[index];
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
                          if (snapshot.connectionState !=
                              ConnectionState.done) {
                            return const SizedBox.shrink();
                          }
                          return CustomBrandContainer(brand: brand);
                        },
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
