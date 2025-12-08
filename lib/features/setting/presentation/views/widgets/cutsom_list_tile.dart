import 'package:flutter/material.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile({
    super.key,
    required this.title,
    required this.subTitle,
    this.onTap,
    required this.icon,
  });
  final String title;
  final String subTitle;
  final void Function()? onTap;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundColor: ColorsApp.bottonColor,
        child: Icon(icon, color: ColorsApp.white),
      ),
      title: Text(
        title,
        style: AppFont.text16.copyWith(
          fontWeight: FontWeight.bold,
          color: ColorsApp.black,
        ),
      ),
      subtitle: Text(
        subTitle,
        style: AppFont.text12.copyWith(fontWeight: FontWeight.bold),
      ),
      trailing: IconButton(
        onPressed: onTap,
        icon: Icon(
          Icons.navigate_next_sharp,
          size: 30,
          color: ColorsApp.bottonColor,
        ),
      ),
    );
  }
}
