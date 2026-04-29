import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class UploadCTA extends StatelessWidget {
  final bool hasPhoto;
  final VoidCallback? onTap;
  const UploadCTA({super.key, required this.hasPhoto, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 16.h),
        decoration: BoxDecoration(
          gradient: hasPhoto
              ? LinearGradient(colors: [AppColors.primary, AppColors.softPink])
              : null,
          color: hasPhoto ? null : Colors.white.withOpacity(0.05),
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              hasPhoto ? Icons.arrow_forward : Icons.upload_outlined,
              color: hasPhoto ? AppColors.white : Colors.white.withOpacity(0.3),
              size: 18.sp,
            ),
            Gap(8.w),
            CustomText(
              text: hasPhoto ? 'choose_reference' : 'upload_to_continue',
              size: 14.sp,
              weight: FontWeight.w700,
              color: hasPhoto ? AppColors.white : Colors.white.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }
}