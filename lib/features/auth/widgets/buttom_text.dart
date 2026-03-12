import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';

class BottomText extends StatelessWidget {
  const BottomText({super.key, required this.onTap, required this.text, required this.actionText});

  final VoidCallback onTap;
  final String text;
  final String actionText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: text,
                style: TextStyle(fontSize: 14.sp, color: AppColors.grey),
              ),
              TextSpan(
                text: actionText,
                style: TextStyle(
                  fontSize: 14.sp,
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}