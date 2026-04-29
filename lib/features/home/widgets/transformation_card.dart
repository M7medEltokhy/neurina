import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';
import 'package:neurina/shared/gradient_button.dart';

class TransformationCard extends StatelessWidget {
  final VoidCallback onStartTap;

  const TransformationCard({super.key, required this.onStartTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32.r),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              const Color(0xFF1E1042).withOpacity(0.8),
              const Color(0xFF2D1458).withOpacity(0.9),
              const Color(0xFF13082A),
            ],
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.15),
              blurRadius: 40,
              offset: const Offset(0, 10),
            ),
          ],
          border: Border.all(color: Colors.white.withOpacity(0.1), width: 1.2),
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(32.r),
          child: Stack(
            children: [
              Positioned(
                right: -20.w,
                top: -20.h,
                child: Container(
                  width: 120.w,
                  height: 120.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: AppColors.primary.withOpacity(0.2),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 50.r,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(24.r),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AiPoweredBadge(),
                    SizedBox(height: 20.h),
                    CustomText(
                      text: 'new_transformation',
                      size: 28.sp,
                      weight: FontWeight.w800,
                      color: AppColors.white,
                    ),
                    SizedBox(height: 12.h),
                    CustomText(
                      text: 'new_transformation_subtitle',
                      size: 14.sp,
                      color: const Color(0xFFC4B5FD).withOpacity(0.8),
                      maxLines: 2,
                    ),
                    SizedBox(height: 24.h),
                    GradientButton(
                      title: 'start_now',
                      onTap: onStartTap,
                      width: 150.w,
                      icon: Icons.arrow_forward,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AiPoweredBadge extends StatelessWidget {
  const AiPoweredBadge({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(0.15),
        borderRadius: BorderRadius.circular(100.r),
        border: Border.all(color: AppColors.primary.withOpacity(0.3)),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 6.w,
            height: 6.w,
            decoration: const BoxDecoration(
              color: Color(0xFFA78BFA),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 8.w),
          CustomText(
            text: 'ai_powered',
            size: 10.sp,
            weight: FontWeight.w700,
            color: const Color(0xFFA78BFA),
          ),
        ],
      ),
    );
  }
}
