import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/func/snakBar.dart';
import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/core/widgets/custom_text_form_filed.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/resetpassord/reset_password_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/resetpassord/reset_password_state.dart';
import 'package:glow_me/features/auth/presentation/views/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key});

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
                SizedBox(height: 52.h),
                CustomAppBar(title: "Reset Password", width: 70),
                SizedBox(height: 10.h),
                Padding(
                  padding: EdgeInsets.only(right: 180.w),
                  child: Text("Forgot Password", style: AppFont.text18),
                ),
                SizedBox(height: 8.h),
                Padding(
                  padding: EdgeInsets.only(right: 15.w),
                  child: Text(
                    "Please enter your email to reset the password",
                    style: AppFont.text14.copyWith(color: ColorsApp.grey300),
                  ),
                ),
                SizedBox(height: 10.h),
                SizedBox(
                  width: 327.w,
                  child: CustomTextFormFiled(
                    controller: read.email,
                    label: "Email",
                    icon: Icon(Icons.email),
                    isHidden: false,
                  ),
                ),
                SizedBox(height: 50.h),

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
