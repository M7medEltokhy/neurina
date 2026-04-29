import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';

class CustomDottedBorder extends StatelessWidget {
  final List<Widget> children;
  final double? height;
  final double? width;

  const CustomDottedBorder({
    super.key,
    required this.children,
    this.height,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return DottedBorder(
      options: RoundedRectDottedBorderOptions(
        radius: const Radius.circular(12),
        color: AppColors.primary,
        strokeWidth: 1,
        dashPattern: const [5, 4],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: width ?? double.infinity,
          height: height ?? 168.h,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(16),
          child: Column(mainAxisSize: MainAxisSize.min, children: children),
        ),
      ),
    );
  }
}
