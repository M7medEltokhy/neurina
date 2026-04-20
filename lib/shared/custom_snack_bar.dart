import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';

SnackBar customSnackBar(String errorMsg) {
  return SnackBar(
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 30.h),
    padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 15.h),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15.r)),
    backgroundColor: Colors.red.shade900,
    content: Row(
      children: [
        Icon(CupertinoIcons.info, color: Colors.white, size: 25.r),
        Gap(10.w),
        Text(
          errorMsg,
          style: TextStyle(
            color: Colors.white,
            fontSize: 14.sp,
            fontWeight: FontWeight.w500,
          ),
          maxLines: 5,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    ),
  );
}
