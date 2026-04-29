import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'welcome_back'.tr(),
                style: TextStyle(
                  fontSize: 15.sp,
                  color: Color(0xFFB4A0FF).withOpacity(0.7),
                  letterSpacing: 0.4,
                ),
              ),
              TextSpan(
                text: 'hello'.tr(), //+ 'name'.tr()
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
        const Spacer(),
        _buildAvatar(),
      ],
    );
  }

  Widget _buildAvatar() {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          width: 46,
          height: 46,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF4C1D95), Color(0xFF831843)],
            ),
            border: Border.all(
              color: AppColors.primary.withOpacity(0.6),
              width: 2,
            ),
          ),
          child: const Center(
            child: Text(
              'S',
              style: TextStyle(
                color: Color(0xFFE9D5FF),
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 1,
          right: 1,
          child: Container(
            width: 11,
            height: 11,
            decoration: BoxDecoration(
              color: const Color(0xFFA78BFA),
              shape: BoxShape.circle,
              border: Border.all(color: const Color(0xFF0A0812), width: 2),
            ),
          ),
        ),
      ],
    );
  }
}
