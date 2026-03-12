import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class WelcomeSubtitle extends StatelessWidget {
  const WelcomeSubtitle({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text:
          'AI-powered face reshaping in\nseconds with unparalleled\nprecision.',
      size: 14.sp,
      color: AppColors.grey,
      weight: FontWeight.w400,
      textAlign: TextAlign.center,
    );
  }
}
