import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/core/constants/fonts.dart';
import 'package:glow_me/features/auth/presentation/views/login_screen.dart';
import 'package:glow_me/features/splash/presentation/views/widgets/custom_indecator.dart';
import 'package:glow_me/features/splash/presentation/views/widgets/custom_page.dart';

class OnbordingScreen extends StatefulWidget {
  const OnbordingScreen({super.key});

  @override
  State<OnbordingScreen> createState() => _OnbordingScreenState();
}

class _OnbordingScreenState extends State<OnbordingScreen> {
  PageController page = PageController();
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 40.h),
            Text(
              "GlowMe",
              style: AppFont.text18.copyWith(color: ColorsApp.bottonColor),
            ),
            Expanded(
              child: PageView(
                onPageChanged: (value) {
                  setState(() {
                    index = value;
                  });
                },
                controller: page,
                children: [
                  CustomPage(
                    text: "Latest\nCosmetics\nEvery Day",
                    subtext:
                        "various types of make up latest and \ntrendy especially for you",
                    image: "assets/images/mescara.png",
                  ),
                  CustomPage(
                    text: "Interesting\nTips and\nTrickes",
                    subtext:
                        "interesting tips and trickes that are\nuseful for your skinti",
                    image: "assets/images/tint.png",
                  ),
                  CustomPage(
                    text: "The price is\ncheaper and \nworth it",
                    subtext:
                        "we provide the best and cheaper \nprice specially for you",
                    image: "assets/images/images.jpg",
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomIndecator(isActive: index == 0),
                SizedBox(width: 5.w),
                CustomIndecator(isActive: index == 1),
                SizedBox(width: 5.w),
                CustomIndecator(isActive: index == 2),
              ],
            ),
            SizedBox(height: 20.h),
            GestureDetector(
              onTap: () {
                if (index == 2) {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return LoginScreen();
                      },
                    ),
                  );
                } else {
                  page.animateToPage(
                    index + 1,
                    duration: Duration(milliseconds: 250),
                    curve: Curves.linear,
                  );
                }
              },
              child: Container(
                height: 60.h,
                width: 70.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40.r),
                  color: ColorsApp.primaryColor,
                ),
                child: Icon(
                  Icons.arrow_forward_ios,
                  color: ColorsApp.darkpink,
                  size: 28.sp,
                ),
              ),
            ),
            SizedBox(height: 30.h),
          ],
        ),
      ),
    );
  }
}
