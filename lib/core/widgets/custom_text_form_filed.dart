import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';

class CustomTextFormFiled extends StatelessWidget {
  const CustomTextFormFiled({
    super.key,
    required this.isHidden,
    required this.label,
    required this.icon,
    this.controller,
    this.onChanged,
  });
  final bool isHidden;
  final String label;
  final Widget icon;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      cursorColor: ColorsApp.grey,
      cursorErrorColor: Colors.red,
      controller: controller,
      obscureText: isHidden,
      validator: (value) {
        if (value!.isEmpty) {
          return "This Filed Is Reqiured";
        } else {
          return null;
        }
      },
      decoration: InputDecoration(
        suffixIcon: icon,
        suffixIconColor: ColorsApp.grey,
        hintText: label,
        hintStyle: TextStyle(color: ColorsApp.grey),
        border: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.grey, width: 2),
          borderRadius: BorderRadius.circular(10.r),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: ColorsApp.grey, width: 2),
          borderRadius: BorderRadius.circular(10.r),
        ),
      ),
    );
  }
}
