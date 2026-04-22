import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class EditProfileConfirmDialog extends StatelessWidget {
  const EditProfileConfirmDialog({
    super.key,
    required this.onConfirm,
  });

  final VoidCallback onConfirm;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFF1A1730),
      surfaceTintColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.r),
        side: const BorderSide(color: Colors.white10, width: 1),
      ),
      title: CustomText(
        text: 'save_changes',
        color: Colors.white,
        size: 18.sp,
        weight: FontWeight.bold,
      ),
      content: CustomText(
        text: 'save_changes_confirmation',
        color: Colors.white54,
        size: 14.sp,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: CustomText(
            text: 'cancel',
            color: Colors.white38,
            weight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
            onConfirm();
          },
          child: CustomText(
            text: 'save',
            color: AppColors.primary,
            weight: FontWeight.w600,
          ),
        ),
      ],
    );
  }
}