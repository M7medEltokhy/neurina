import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class UploadTopBar extends StatelessWidget {
  const UploadTopBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Container(
            width: 36.w,
            height: 36.w,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.06),
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white.withOpacity(0.1)),
            ),
            child: Icon(Icons.arrow_back_ios_new_rounded, size: 14.sp, color: AppColors.white),
          ),
        ),
        Gap(12.w),
        CustomText(text: 'upload_source', size: 18.sp, weight: FontWeight.w700, color: AppColors.white),
        const Spacer(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 5.h),
          decoration: BoxDecoration(
            color: AppColors.primary.withOpacity(0.15),
            borderRadius: BorderRadius.circular(100.r),
            border: Border.all(color: AppColors.primary.withOpacity(0.4)),
          ),
          child: CustomText(text: 'step_1_2', size: 11.sp, weight: FontWeight.w600, color: AppColors.primary),
        ),
      ],
    );
  }
}