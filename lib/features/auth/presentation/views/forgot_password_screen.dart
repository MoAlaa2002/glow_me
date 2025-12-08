import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/func/snakBar.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/core/widgets/custom_text_form_filed.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/resetpassord/reset_password_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/resetpassord/reset_password_state.dart';
import 'package:glow_me/features/auth/presentation/views/login_screen.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<ResetPasswordCubit>();
    return Scaffold(
      body: BlocConsumer<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is LoadedResetPassState) {
            snackBar(
              msg: 'Check Your Email To Reset Your Password',
              context: context,
            );
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) {
                  return LoginScreen();
                },
              ),
            );
          }
          if (state is FailureResetPassState) {
            snackBar(msg: state.errormsg, context: context);
          }
        },
        builder: (context, state) {
          return Form(
            key: read.resetkey,
            child: Column(
              children: [
                SizedBox(height: 50.h),
                Padding(
                  padding: EdgeInsets.only(right: 290.w),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(Icons.arrow_back_ios_new_rounded, size: 30),
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0, right: 100),
                  child: Text("Forgot Password", style: AppFont.text24),
                ),
                SizedBox(height: 5.h),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 50),
                  child: Text(
                    "Please enter your email to reset the password",
                    style: AppFont.text12,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 30.h,
                    horizontal: 8.w,
                  ),
                  child: CustomTextFormFiled(
                    controller: read.email,
                    isHidden: false,
                    label: "Email",
                    icon: Icon(Icons.email_rounded),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: state is LoadedResetPassState
                      ? Center(
                          child: CircularProgressIndicator(
                            color: ColorsApp.bottonColor,
                          ),
                        )
                      : CustomButton(
                          height: 40.h,
                          width: double.infinity,
                          text: 'Reset Password',

                          color: ColorsApp.bottonColor,
                          ontap: () {
                            read.resetValiate();
                          },
                        ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
