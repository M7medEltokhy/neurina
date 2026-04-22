import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class ProfileSectionTitle extends StatelessWidget {
  const ProfileSectionTitle({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return CustomText(
      text: title.toUpperCase(),
      size: 12.sp,
      color: AppColors.primary,
      weight: FontWeight.w600,
    );
  }
}