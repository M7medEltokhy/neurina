import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/features/welcome/widgets/welcome_scan_line.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key, required this.scanAnimation});

  final Animation<double> scanAnimation;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280.w,
      height: 320.h,
      decoration: BoxDecoration(
        color: AppColors.cardSurface,
        borderRadius: BorderRadius.circular(24.r),
        border: Border.all(
          color: AppColors.primary.withOpacity(0.4),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.primary.withOpacity(0.2),
            blurRadius: 24,
            spreadRadius: -4,
          ),
        ],
      ),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset('assets/onboarding/hero_visual.png', fit: BoxFit.cover),
          WelcomeScanLine(animation: scanAnimation),
        ],
      ),
    );
  }
}