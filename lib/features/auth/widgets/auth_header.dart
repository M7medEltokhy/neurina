import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class AuthHeader extends StatelessWidget {
  const AuthHeader({
    super.key,
    required this.title,
    required this.gradientWord,
    required this.subtitle,
  });

  final String title;
  final String gradientWord;
  final String subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: title.tr(),
                style: TextStyle(
                  fontSize: 32.sp,
                  color: AppColors.white,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                ),
              ),
              TextSpan(
                text: gradientWord.tr(),
                style: TextStyle(
                  fontSize: 32.sp,
                  fontWeight: FontWeight.w700,
                  height: 1.3,
                  foreground: Paint()
                    ..shader = LinearGradient(
                      colors: [AppColors.primary, AppColors.softPink],
                    ).createShader(Rect.fromLTWH(0, 0, 140.w, 40.h)),
                ),
              ),
            ],
          ),
        ),
        Gap(8.h),
        CustomText(
          text: subtitle,
          size: 14.sp,
          color: AppColors.grey,
          weight: FontWeight.w400,
        ),
      ],
    );
  }
}