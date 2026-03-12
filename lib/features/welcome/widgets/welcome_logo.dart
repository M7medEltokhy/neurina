import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 60.w,
          height: 60.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary.withOpacity(0.1),
            boxShadow: [
              BoxShadow(
                color: AppColors.softBlue.withOpacity(0.2),
                blurRadius: 20,
              ),
            ],
          ),
          child: Icon(
            Icons.face_retouching_natural_outlined,
            color: AppColors.primary,
            size: 30.sp,
          ),
        ),
        Gap(10.h),
        CustomText(
          text: 'FACECRAFT AI',
          size: 16.sp,
          color: AppColors.white,
          weight: FontWeight.w700,
        ),
      ],
    );
  }
}