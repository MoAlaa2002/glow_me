import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/features/home/data/model/product_type_model.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_cubit.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_state.dart';
import 'package:glow_me/features/home/presentation/views/products_by_type_screen.dart';

class CustomProductList extends StatelessWidget {
  const CustomProductList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<TypeOfProductCubit, TypeOfProductState>(
      listener: (context, state) {
        if (state is LoadedTypeOfProductState) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return ProductsByTypeScreen(product: state.list);
              },
            ),
          );
        } else if (state is FailureTypeOfProductState) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.errormsg)));
        } else {
          CircularProgressIndicator();
        }
      },
      child: SliverToBoxAdapter(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(right: 230.w),
                child: Text(
                  "Categories",
                  style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
                ),
              ),
              SizedBox(
                height: 90.h,
                child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: productsType.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        final selectedType = productsType[index].productName;
                        context.read<TypeOfProductCubit>().fetchProducttype(
                          productsType: selectedType,
                        );
                      },
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                              radius: 30.r,
                              backgroundImage: AssetImage(
                                productsType[index].productImage,
                              ),
                              backgroundColor: ColorsApp.white,
                            ),
                            SizedBox(height: 8.h),
                            Text(
                              productsType[index].productName,
                              style: AppFont.text12.copyWith(
                                color: ColorsApp.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
