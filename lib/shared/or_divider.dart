import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class OrDivider extends StatelessWidget {
  const OrDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
      children: [
        Expanded(child: Divider(color: AppColors.softBlue.withOpacity(0.4))),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          child: CustomText(text: 'or', size: 14.sp, color: AppColors.grey),
        ),
        Expanded(child: Divider(color: AppColors.softBlue.withOpacity(0.4))),
      ],
    );
  }
}