import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

enum SnackBarType { error, success, info }

SnackBar customSnackBar(String message, {SnackBarType type = SnackBarType.error}) {
  final config = switch (type) {
    SnackBarType.error   => (color: Colors.red.shade900,    icon: CupertinoIcons.xmark_circle),
    SnackBarType.success => (color: Colors.green.shade800,  icon: CupertinoIcons.checkmark_circle),
    SnackBarType.info    => (color: Colors.blue.shade800,   icon: CupertinoIcons.info_circle),
  };

  return SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    backgroundColor: config.color,
    content: Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(config.icon, color: Colors.white, size: 25.r),
        Gap(10.w),
        Expanded(
          child: Text(
            message,
            style: TextStyle(
              color: Colors.white,
              fontSize: 14.sp,
              fontWeight: FontWeight.w500,
            ),
            maxLines: 5,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    ),
  );
}