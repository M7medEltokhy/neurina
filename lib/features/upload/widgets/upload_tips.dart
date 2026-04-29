import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class UploadTips extends StatelessWidget {
  const UploadTips({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UploadTipChip(icon: Icons.timer_outlined, text: 'clear_front_facing'),
        Gap(8.w),
        UploadTipChip(icon: Icons.person_outline_rounded, text: 'one_face_visible'),
      ],
    );
  }
}

class UploadTipChip extends StatelessWidget {
  final IconData icon;
  final String text;
  const UploadTipChip({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(100.r),
          border: Border.all(color: Colors.white.withOpacity(0.07)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 13.sp, color: AppColors.primary),
            Gap(6.w),
            Flexible(
              child: CustomText(text: text, size: 10.sp, color: Colors.white.withOpacity(0.55), maxLines: 1),
            ),
          ],
        ),
      ),
    );
  }
}