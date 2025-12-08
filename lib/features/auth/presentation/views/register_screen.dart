import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/utils/func/snakBar.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/core/widgets/custom_phone_number_filed.dart';
import 'package:glow_me/core/widgets/custom_text_form_filed.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/register/register_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/register/register_state.dart';
import 'package:glow_me/features/auth/presentation/views/login_screen.dart';
import 'package:glow_me/features/auth/presentation/views/widgets/auth_text_row.dart';
import 'package:glow_me/features/auth/presentation/views/widgets/custom_terms_and_condtions.dart';
import 'package:glow_me/features/auth/presentation/views/widgets/password_icon.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var read = context.read<RegisterCubit>();
    return Scaffold(
      body: SingleChildScrollView(
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is LoadedRegisterSate) {
              snackBar(
                msg: "Created Account Successfully,Please Check Your Email. ",
                context: context,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return LoginScreen();
                  },
                ),
              );
            } else if (state is FailureRegisterSate) {
              snackBar(msg: state.errormsg, context: context);
            }
          },
          builder: (context, state) {
            return Form(
              key: read.keyRegister,
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
                  //SizedBox(height: 50.h),
                  Text("Welcome", style: AppFont.text24),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.1.w,
                      top: 30.h,
                      right: 250.w,
                    ),
                    child: Text("UserName", style: AppFont.text18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: CustomTextFormFiled(
                      controller: read.name,
                      isHidden: false,
                      label: "Enter Your Username",
                      icon: Icon(Icons.person_2_rounded),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.1.w,
                      top: 20.h,
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
                      top: 20.h,
                      right: 210.w,
                      bottom: 10.h,
                    ),
                    child: Text("PhoneNumber", style: AppFont.text18),
                  ),
                  SizedBox(
                    width: 327.w,
                    child: CustomPhoneNumberFiled(
                      read: read.phonenumber.text,
                      controller: read.phonenumber,
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
                      icon: PasswordIcon(),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 10.1.w,
                      top: 20.h,
                      right: 180.w,
                    ),
                    child: Text("Confirm Password", style: AppFont.text18),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                      right: 10.w,
                      left: 10.w,
                    ),
                    child: CustomTextFormFiled(
                      controller: read.confirmPassword,
                      isHidden: !read.isShowPass,
                      label: "Enter Your Confirm Password",
                      icon: PasswordIcon(),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  CustomTermsAndConditions(),
                  SizedBox(height: 10.h),
                  Padding(
                    padding: EdgeInsets.only(top: 15.h, left: 8.w, right: 8.w),
                    child: state is LoadingRegisterSate
                        ? Center(
                            child: CircularProgressIndicator(
                              color: ColorsApp.bottonColor,
                            ),
                          )
                        : CustomButton(
                            width: double.infinity.w,
                            height: 40.h,
                            color: read.value == false
                                ? ColorsApp.grey
                                : ColorsApp.bottonColor,
                            text: "SignUp",
                            ontap: () {
                              if (read.value == true) {
                                read.registerValidate();
                                read.confirmPass();
                              }
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
                      title: "Already have account ?",
                      subTitle: "Login",
                      onTap: () {
                        Navigator.pop(context);
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
