import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class GradientButton extends StatelessWidget {
  const GradientButton({super.key, required this.title, required this.onTap});

  final String title;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 56.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.r),
          gradient: LinearGradient(
            colors: [AppColors.primary, AppColors.softPink],
          ),
        ),
        child: Center(
          child: CustomText(
            text: title,
            size: 16.sp,
            color: AppColors.white,
            weight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

