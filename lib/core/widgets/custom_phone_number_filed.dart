import 'package:flutter/material.dart';
import 'package:flutter_intl_phone_field/flutter_intl_phone_field.dart';
import 'package:glow_me/core/constants/colors.dart';

class CustomPhoneNumberFiled extends StatelessWidget {
  CustomPhoneNumberFiled({
    super.key,
    required this.read,
    required this.controller,
  });

  final String read;
  final FocusNode focusNode = FocusNode();
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      controller: controller,
      initialValue: read,
      focusNode: focusNode,
      decoration: InputDecoration(
        labelText: 'Phone Number',
        labelStyle: TextStyle(color: ColorsApp.grey),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      languageCode: "en",
      onChanged: (phone) {
        print(phone.completeNumber);
      },
      onCountryChanged: (country) {
        print('Country changed to: ${country.name}');
      },
    );
  }
}
