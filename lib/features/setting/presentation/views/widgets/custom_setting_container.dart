import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/features/setting/presentation/views/widgets/cutsom_list_tile.dart';

class CustomSettingsContainer extends StatelessWidget {
  const CustomSettingsContainer({
    super.key,
    required this.firstTitle,
    required this.firstSubTitle,
    required this.firstIcon,
    required this.secondTitle,
    required this.secondSubTitle,
    required this.secondIcon,
    this.firstOnTap,
    this.secondOnTap,
  });
  final String firstTitle;
  final String firstSubTitle;
  final IconData firstIcon;
  final void Function()? firstOnTap;

  final String secondTitle;
  final String secondSubTitle;
  final IconData secondIcon;
  final void Function()? secondOnTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 8.0.w),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          color: ColorsApp.secandryColor,
          borderRadius: BorderRadius.circular(15.r),
        ),
        child: Column(
          children: [
            SizedBox(height: 5.h),
            CustomListTile(
              title: firstTitle,
              subTitle: firstSubTitle,
              icon: firstIcon,
              onTap: firstOnTap,
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Divider(color: ColorsApp.grey200),
            ),
            CustomListTile(
              title: secondTitle,
              subTitle: secondSubTitle,
              icon: secondIcon,
              onTap: secondOnTap,
            ),
          ],
        ),
      ),
    );
  }
}
