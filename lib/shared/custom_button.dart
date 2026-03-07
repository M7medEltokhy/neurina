import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.onTap,
    required this.height,
    required this.width,
    required this.border,
    this.title,
    this.icon,
    this.color,
    this.textColor,
    this.borderColor,
    this.borderWidth,
  });

  final VoidCallback onTap;
  final String? title;
  final IconData? icon;
  final double height;
  final double width;
  final double border;
  final double? borderWidth;
  final Color? color;
  final Color? textColor;
  final Color? borderColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: height.h,
        width: width.w,
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor ?? Colors.transparent,
            width: borderWidth ?? 1,
          ),
          borderRadius: BorderRadius.circular(border.r),
          color: color ?? AppColors.primary,
        ),
        child: Center(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) Icon(icon, color: textColor ?? Colors.white),

              if (icon != null && title != null) SizedBox(width: 8.w),

              if (title != null)
                CustomText(
                  text: title!,
                  size: 18.sp,
                  color: textColor ?? Colors.white,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
