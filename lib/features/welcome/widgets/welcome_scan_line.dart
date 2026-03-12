import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';

class WelcomeScanLine extends StatelessWidget {
  const WelcomeScanLine({super.key, required this.animation});

  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      builder: (context, _) => Positioned(
        top: animation.value * 320.h,
        left: 0,
        right: 0,
        child: Container(
          height: 2.h,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.transparent,
                AppColors.primary.withOpacity(0.9),
                AppColors.white.withOpacity(0.6),
                AppColors.primary.withOpacity(0.9),
                Colors.transparent,
              ],
            ),
          ),
        ),
      ),
    );
  }
}