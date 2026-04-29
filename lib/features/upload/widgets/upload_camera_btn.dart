import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/shared/custom_text.dart';

class UploadCameraBtn extends StatelessWidget {
  final VoidCallback onTap;
  const UploadCameraBtn({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 14.h),
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.04),
          borderRadius: BorderRadius.circular(14.r),
          border: Border.all(color: Colors.white.withOpacity(0.09)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.camera_alt_outlined, color: Colors.white.withOpacity(0.5), size: 18.sp),
            Gap(8.w),
            CustomText(text: 'take_live_photo', size: 13.sp, weight: FontWeight.w600, color: Colors.white.withOpacity(0.5)),
          ],
        ),
      ),
    );
  }
}