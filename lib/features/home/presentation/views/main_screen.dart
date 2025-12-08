import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glow_me/core/constants/colors.dart';
import 'package:glow_me/features/home/presentation/views/home_screen.dart';
import 'package:glow_me/features/setting/presentation/views/setting_screen.dart';
import 'package:glow_me/features/wishlist/presentation/views/wishlist_screen.dart';
import 'package:glow_me/features/search/presentation/views/search_screen.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainPageState();
}

class _MainPageState extends State<MainScreen> {
  int pageIndex = 0;

  late final List<Widget> pages = [
    HomeScreen(),
    const SearchScreen(),
    const WishlistScreen(),
    const SettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[pageIndex],
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
        child: GNav(
          rippleColor: ColorsApp.bottonColor,
          hoverColor: ColorsApp.bottonColor,
          haptic: true,
          tabBorderRadius: 15,
          tabActiveBorder: Border.all(color: ColorsApp.white, width: 1),
          tabBorder: Border.all(color: Colors.grey.withOpacity(0.5), width: 1),
          tabShadow: [BoxShadow(color: ColorsApp.bottonColor, blurRadius: 8)],
          curve: Curves.easeOutExpo,
          duration: const Duration(milliseconds: 400),
          gap: 8,
          color: ColorsApp.darkpink,
          activeColor: ColorsApp.white,
          iconSize: 24,
          tabBackgroundColor: ColorsApp.primaryColor,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          selectedIndex: pageIndex,
          onTabChange: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.search, text: 'Search'),
            GButton(icon: Icons.favorite, text: 'Wishlist'),
            GButton(icon: Icons.settings, text: 'Settings'),
          ],
        ),
      ),
    );
  }
}
