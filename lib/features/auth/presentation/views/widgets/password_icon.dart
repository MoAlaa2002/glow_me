import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/register/register_cubit.dart';

class PasswordIcon extends StatefulWidget {
  const PasswordIcon({super.key});

  @override
  State<PasswordIcon> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<PasswordIcon> {
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPassword = !isPassword;
          BlocProvider.of<RegisterCubit>(context).showpass();
        });
      },
      icon: isPassword
          ? Icon(Icons.visibility_rounded)
          : Icon(Icons.visibility_off_rounded),
    );
  }
}
