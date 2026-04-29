import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class UploadStepsIndicator extends StatelessWidget {
  const UploadStepsIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        UploadStepCircle(number: 1, label: 'upload', isActive: true),
        UploadStepLine(isDone: false),
        UploadStepCircle(number: 2, label: 'reference', isActive: false),
        UploadStepLine(isDone: false),
        UploadStepCircle(number: 3, label: 'generate', isActive: false),
      ],
    );
  }
}

class UploadStepCircle extends StatelessWidget {
  final int number;
  final String label;
  final bool isActive;
  const UploadStepCircle({super.key, required this.number, required this.label, required this.isActive});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: isActive ? LinearGradient(colors: [AppColors.primary, AppColors.softPink]) : null,
            color: isActive ? null : Colors.white.withOpacity(0.06),
            border: isActive ? null : Border.all(color: Colors.white.withOpacity(0.1)),
          ),
          child: Center(
            child: Text(
              '$number',
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: isActive ? AppColors.white : Colors.white.withOpacity(0.3),
              ),
            ),
          ),
        ),
        Gap(4.h),
        CustomText(
          text: label,
          size: 10.sp,
          weight: FontWeight.w600,
          color: isActive ? AppColors.primary : Colors.white.withOpacity(0.3),
        ),
      ],
    );
  }
}

class UploadStepLine extends StatelessWidget {
  final bool isDone;
  const UploadStepLine({super.key, required this.isDone});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 2,
        margin: EdgeInsets.only(bottom: 18.h),
        decoration: BoxDecoration(
          gradient: isDone ? LinearGradient(colors: [AppColors.primary, AppColors.softPink]) : null,
          color: isDone ? null : Colors.white.withOpacity(0.07),
          borderRadius: BorderRadius.circular(2),
        ),
      ),
    );
  }
}