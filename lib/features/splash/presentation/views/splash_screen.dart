import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/sharedPrefrances/shred_pref_cache.dart';
import 'package:glow_me/features/home/presentation/views/main_screen.dart';
import 'package:glow_me/features/splash/presentation/views/onbording_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double opacityLevel = 0.0;
  @override
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() => opacityLevel = 0);
    });

    Future.delayed(const Duration(seconds: 1), () {
      setState(() => opacityLevel = 1);
    });

    Future.delayed(const Duration(seconds: 3), () {
      navigate();
    });
  }

  void navigate() {
    final bool? isLoggedIn = SharedPrefCache.getData(key: 'isLoggedIn');

    final user = FirebaseAuth.instance.currentUser;
    if (isLoggedIn == true) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainScreen()),
      );
      return;
    }

    if (user == null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnbordingScreen()),
      );
    } else if (user.emailVerified) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => MainScreen()),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => OnbordingScreen()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedOpacity(
          curve: Curves.easeInOut,
          opacity: opacityLevel,
          duration: Duration(seconds: 1),
          child: Image.asset(
            "assets/images/logo.png",
            height: 250.h,
            width: 250.w,
          ),
        ),
      ),
    );
  }
}
