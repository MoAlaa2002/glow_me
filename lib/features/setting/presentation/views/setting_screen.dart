import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/features/auth/presentation/views/controller/cubit/login/login_cubit.dart';
import 'package:glow_me/features/auth/presentation/views/login_screen.dart';
import 'package:glow_me/features/setting/presentation/views/edit_profile_screen.dart';
import 'package:glow_me/features/setting/presentation/views/reset_password_screen.dart';
import 'package:glow_me/features/setting/presentation/views/widgets/custom_setting_container.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 8.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 40.h),
              Center(
                child: Text(
                  "Settings",
                  style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
                ),
              ),
              SizedBox(height: 10),
              Text(
                "Account",
                style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
              ),
              SizedBox(height: 10),

              CustomSettingsContainer(
                firstTitle: 'Edit Profile',
                firstSubTitle: 'Manage your profile information',
                firstOnTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return EditProfileScreen();
                      },
                    ),
                  );
                },
                firstIcon: Icons.person_2_outlined,
                secondTitle: 'Change Password',
                secondSubTitle: 'Update your account security',
                secondIcon: Icons.lock,
                secondOnTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return ResetPasswordScreen();
                      },
                    ),
                  );
                },
              ),
              SizedBox(height: 20.h),
              Text(
                "Prefernces",
                style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
              ),
              SizedBox(height: 10),
              CustomSettingsContainer(
                firstTitle: 'Notifications',
                firstSubTitle: 'Manage your notofication settings',
                firstIcon: Icons.notifications_outlined,
                secondTitle: 'Privacy',
                secondSubTitle: 'Review and adjust your privacy settings',
                secondIcon: Icons.shield_outlined,
              ),
              SizedBox(height: 20.h),
              Text(
                "Help & Support",
                style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
              ),
              SizedBox(height: 10),
              CustomSettingsContainer(
                firstTitle: 'FAQs',
                firstSubTitle: 'find answers to common questions',
                firstIcon: Icons.question_mark_sharp,
                secondTitle: 'Contact Us',
                secondSubTitle: 'Get in touch with our support team',
                secondIcon: Icons.email_outlined,
              ),
              SizedBox(height: 20.h),
              Text(
                "About",
                style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
              ),
              SizedBox(height: 10),
              CustomSettingsContainer(
                firstTitle: 'App Version',
                firstSubTitle: 'Version 0.0.1',
                firstIcon: Icons.system_update_alt,
                secondTitle: 'Terms of Service',
                secondSubTitle: 'Review our terms of service',
                secondIcon: Icons.notes_rounded,
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: CustomButton(
                  width: double.infinity,
                  height: 40.h,
                  color: ColorsApp.bottonColor,
                  text: "Log Out",
                  ontap: () async {
                    await BlocProvider.of<LoginCubit>(context).logout();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LoginScreen();
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 10.h),
            ],
          ),
        ),
      ),
    );
  }
}
