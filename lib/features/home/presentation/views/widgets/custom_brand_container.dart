import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/features/home/data/model/brands_model.dart';
import 'package:glow_me/features/home/presentation/controller/product_type/type_of_product_cubit.dart';

class CustomBrandContainer extends StatelessWidget {
  const CustomBrandContainer({super.key, required this.brand});

  final BrandsModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.read<TypeOfProductCubit>().fetchProducttype(
          productBrand: brand.brandName,
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.r),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              spreadRadius: 2,
              color: Colors.black12,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20.r),
              child: Image.asset(
                brand.brandImage,
                width: 100.w,
                height: 100.h,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 8.h),
            Text(
              brand.brandName,
              style: AppFont.text14.copyWith(
                color: ColorsApp.black,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
