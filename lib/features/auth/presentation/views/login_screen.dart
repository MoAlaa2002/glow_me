import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/func/check_email_verfication.dart';
import 'package:glow_me/core/utils/func/snakBar.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/core/widgets/custom_text_form_filed.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/login/login_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/login/login_state.dart';
import 'package:glow_me/features/auth/presentation/views/forgot_password_screen.dart';
import 'package:glow_me/features/auth/presentation/views/register_screen.dart';
import 'package:glow_me/features/auth/presentation/views/widgets/auth_text_row.dart';
import 'package:glow_me/features/home/presentation/views/main_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<LoginCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) async {
            if (state is LoadedLoginState) {
              bool isVerfied = await checkEmailVerification(context);
              if (isVerfied) {
                snackBar(msg: 'Welcome Back...', context: context);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MainScreen();
                    },
                  ),
                );
              } else {
                snackBar(msg: "Please verify your email.", context: context);
              }
            }
          },
          builder: (context, state) {
            return Form(
              key: read.loginKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                //crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 40.h),
                  Text(
                    "GlowMe",
                    style: AppFont.text18.copyWith(
                      color: ColorsApp.bottonColor,
                    ),
                  ),
                  SizedBox(height: 80.h),
                  Text("Welcome back!", style: AppFont.text24),

                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.1.w,
                      top: 30.h,
                      right: 280.w,
                    ),
                    child: Text("Email", style: AppFont.text18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: CustomTextFormFiled(
                      controller: read.email,
                      isHidden: false,
                      label: "Enter Your Email",
                      icon: Icon(Icons.email_rounded),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.1.w,
                      top: 10.h,
                      right: 250.w,
                    ),
                    child: Text("Password", style: AppFont.text18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: CustomTextFormFiled(
                      controller: read.password,
                      isHidden: !read.isShowPass,
                      label: "Enter Your Password",
                      icon: LoginPasswordIcon(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 200.w,
                      top: 10.h,
                      right: 10.w,
                      bottom: 30.h,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return ForgotPasswordScreen();
                            },
                          ),
                        );
                      },
                      child: Text(
                        "Forgot Password?",
                        style: AppFont.text12.copyWith(color: ColorsApp.black),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: state is LoadingLoginState
                        ? Center(
                            child: CircularProgressIndicator(
                              color: ColorsApp.bottonColor,
                            ),
                          )
                        : CustomButton(
                            width: double.infinity.w,
                            height: 40.h,
                            color: ColorsApp.bottonColor,
                            text: "Login",
                            ontap: () {
                              read.loginValidate();
                            },
                          ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 25.h,
                      left: 60.w,
                      right: 30.w,
                    ),
                    child: AuthTextRow(
                      title: "Don't have account ?",
                      subTitle: "SignUp",
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) {
                              return RegisterScreen();
                            },
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class LoginPasswordIcon extends StatefulWidget {
  const LoginPasswordIcon({super.key});

  @override
  State<LoginPasswordIcon> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<LoginPasswordIcon> {
  bool isPassword = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(() {
          isPassword = !isPassword;
          BlocProvider.of<LoginCubit>(context).showpass();
        });
      },
      icon: isPassword
          ? Icon(Icons.visibility_rounded)
          : Icon(Icons.visibility_off_rounded),
    );
  }
}
