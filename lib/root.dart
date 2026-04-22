import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/features/home/screens/home_screen.dart';
import 'package:neurina/features/profile/cubit/profile_cubit.dart';
import 'package:neurina/features/profile/data/profile_repo.dart';
import 'package:neurina/features/profile/screens/profile_screen.dart';

class Root extends StatefulWidget {
  const Root({super.key});

  @override
  State<Root> createState() => _RootState();
}

class _RootState extends State<Root> {
  int currentScreen = 0;
  late PageController controller;
  late List<Widget> screens;

  @override
  void initState() {
    screens = [
      HomeScreen(),
      HomeScreen(),
      BlocProvider(
        create: (context) =>
            ProfileCubit(profileRepo: ProfileRepo())..getProfile(),
        child: ProfileScreen(),
      ),
    ];
    controller = PageController(initialPage: currentScreen);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: screens,
          ),
          Positioned(
            bottom: 20.h,
            left: 30.w,
            right: 30.w,
            child: Container(
              // margin: EdgeInsets.only(bottom: 20.h, right: 10.w, left: 10.w),
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    // color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
                color: AppColors.cardSurface.withOpacity(0.9),
                borderRadius: BorderRadius.circular(50.r),
              ),
              child: Row(
                children: [
                  _NavItem(
                    icon: CupertinoIcons.home,
                    label: 'Home',
                    isActive: currentScreen == 0,
                    onTap: () => _navigateTo(0),
                  ),
                  _NavItem(
                    icon: Icons.photo_library_outlined,
                    label: 'My Photos',
                    isActive: currentScreen == 1,
                    onTap: () => _navigateTo(1),
                  ),
                  _NavItem(
                    icon: CupertinoIcons.profile_circled,
                    label: 'Profile',
                    isActive: currentScreen == 2,
                    onTap: () => _navigateTo(2),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateTo(int index) {
    setState(() => currentScreen = index);
    controller.jumpToPage(index);
  }
}

class _NavItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _NavItem({
    required this.icon,
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        behavior: HitTestBehavior.opaque,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 220),
          curve: Curves.easeIn,
          padding: EdgeInsets.symmetric(vertical: 10.h),
          decoration: BoxDecoration(
            color: isActive
                ? AppColors.primary.withOpacity(0.2)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(50.r),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                icon,
                size: 25.sp,
                color: isActive ? AppColors.primary : Colors.grey.shade700,
              ),
              Gap(3.h),
              Text(
                label.tr(),
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: isActive ? FontWeight.w600 : FontWeight.w400,
                  color: isActive ? AppColors.primary : Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
