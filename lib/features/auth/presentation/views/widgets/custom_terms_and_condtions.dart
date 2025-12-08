import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/register/register_cubit.dart';

class CustomTermsAndConditions extends StatefulWidget {
  const CustomTermsAndConditions({super.key});

  @override
  State<CustomTermsAndConditions> createState() =>
      _CustomTermsAndConditionsState();
}

class _CustomTermsAndConditionsState extends State<CustomTermsAndConditions> {
  bool? value = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: value,
          onChanged: (newValue) {
            setState(() {
              value = newValue;
              BlocProvider.of<RegisterCubit>(
                context,
              ).temsAndCondtions(newValue);
            });
          },
        ),
        Text(
          "I have agree to our Terms and Condition",
          style: AppFont.text12.copyWith(
            color: ColorsApp.primaryColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}
