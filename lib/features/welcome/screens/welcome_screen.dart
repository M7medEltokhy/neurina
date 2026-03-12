import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/features/welcome/widgets/welcome_buttons.dart';
import 'package:neurina/features/welcome/widgets/welcome_card.dart';
import 'package:neurina/features/welcome/widgets/welcome_head_line.dart';
import 'package:neurina/features/welcome/widgets/welcome_logo.dart';
import 'package:neurina/features/welcome/widgets/welcome_subtitle.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _scanController = AnimationController(
    duration: const Duration(seconds: 3),
    vsync: this,
  )..repeat();

  late final Animation<double> _scanAnimation = Tween<double>(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: _scanController, curve: Curves.linear));

  @override
  void dispose() {
    _scanController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.scaffold,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: Column(
            children: [
              Gap(32.h),
              const WelcomeLogo(),
              Gap(28.h),
              WelcomeCard(scanAnimation: _scanAnimation),
              Gap(32.h),
              const WelcomeHeadline(),
              Gap(12.h),
              const WelcomeSubtitle(),
              const Spacer(),
              const WelcomeButtons(),
              Gap(24.h),
            ],
          ),
        ),
      ),
    );
  }
}
