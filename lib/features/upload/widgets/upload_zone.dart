import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_dotted_border.dart';
import 'package:neurina/shared/custom_text.dart';

class UploadZone extends StatelessWidget {
  final VoidCallback onTap;
  const UploadZone({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CustomDottedBorder(
        height: 200.h,
        children: [
          Container(
            width: 52.w,
            height: 52.w,
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.12),
              borderRadius: BorderRadius.circular(14.r),
              border: Border.all(color: AppColors.primary.withOpacity(0.25)),
            ),
            child: Icon(Icons.image_outlined, color: AppColors.primary, size: 26.sp),
          ),
          Gap(14.h),
          CustomText(text: 'tap_to_upload', size: 16.sp, weight: FontWeight.w700, color: AppColors.white),
          Gap(6.h),
          CustomText(text: 'upload_subtitle', size: 12.sp, color: const Color(0xFFB4A0FF).withOpacity(0.6), maxLines: 2),
          Gap(14.h),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: ['JPG', 'PNG', 'HEIC']
                .map((f) => Padding(
                      padding: EdgeInsets.only(right: 6.w),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
                        decoration: BoxDecoration(
                          color: AppColors.primary.withOpacity(0.12),
                          borderRadius: BorderRadius.circular(6.r),
                          border: Border.all(color: AppColors.primary.withOpacity(0.3)),
                        ),
                        child: CustomText(text: f, size: 10.sp, weight: FontWeight.w600, color: AppColors.primary),
                      ),
                    ))
                .toList(),
          ),
        ],
      ),
    );
  }
}