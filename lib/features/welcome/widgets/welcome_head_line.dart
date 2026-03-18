import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class WelcomeHeadline extends StatelessWidget {
  const WelcomeHeadline({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: 'your_face',
          size: 34.sp,
          color: AppColors.white,
          weight: FontWeight.w800,
        ),
        ShaderMask(
          shaderCallback: (bounds) => LinearGradient(
            colors: [AppColors.primary, AppColors.softPink],
          ).createShader(bounds),
          child: CustomText(
            text: 'reimagined',
            size: 34.sp,
            color: AppColors.white,
            weight: FontWeight.w800,
          ),
        ),
      ],
    );
  }
}