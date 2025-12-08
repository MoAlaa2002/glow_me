import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/widgets/custom_app_bar.dart';
import 'package:glow_me/core/widgets/custom_button.dart';
import 'package:glow_me/core/widgets/custom_text_form_filed.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(height: 40.h),
              CustomAppBar(title: "Edit Profile", width: 70.w),
              SizedBox(height: 20.h),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 50.r,

                    backgroundImage: const AssetImage('assets/images/mo.jpeg'),
                  ),
                  Container(
                    width: 30.w,
                    height: 30.h,
                    decoration: const BoxDecoration(
                      color: ColorsApp.bottonColor,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.edit,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),

              SizedBox(height: 25.h),

              const CustomTextFormFiled(
                label: "Name",
                isHidden: false,
                icon: Icon(Icons.person_2),
              ),
              SizedBox(height: 20.h),

              const CustomTextFormFiled(
                label: "Email",
                isHidden: false,
                icon: Icon(Icons.email_rounded),
              ),
              SizedBox(height: 20.h),

              const CustomTextFormFiled(
                label: "Phone Number",
                isHidden: false,
                icon: Icon(Icons.phone_rounded),
              ),
              SizedBox(height: 20.h),

              const CustomTextFormFiled(
                label: "Shipping Address",
                isHidden: false,
                icon: Icon(Icons.location_on),
              ),
              SizedBox(height: 20.h),

              const CustomTextFormFiled(
                label: "Billing Address",
                isHidden: false,
                icon: Icon(Icons.home_filled),
              ),

              SizedBox(height: 40.h),

              CustomButton(
                width: double.infinity,
                height: 40.h,
                color: ColorsApp.bottonColor,
                text: "Save Changes",
                ontap: () {},
              ),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
