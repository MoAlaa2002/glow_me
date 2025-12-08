import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

class AuthTextRow extends StatelessWidget {
  final String title;
  final String subTitle;
  final VoidCallback onTap;

  const AuthTextRow({
    super.key,
    required this.title,
    required this.subTitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 25.0.w),
      child: Row(
        children: [
          Text(title, style: AppFont.text12.copyWith(color: ColorsApp.black)),
          SizedBox(width: 5.w),
          InkWell(
            onTap: onTap,
            child: Text(
              subTitle,
              style: AppFont.text16.copyWith(color: ColorsApp.primaryColor),
            ),
          ),
        ],
      ),
    );
  }
}
