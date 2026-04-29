import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';

class YourTransformationsSection extends StatelessWidget {
  final List items;
  final VoidCallback onSeeAllTap;
  final void Function(dynamic) onCardTap;
  final String Function(dynamic) getSourceUrl;
  final String Function(dynamic) getResultUrl;
  final String Function(dynamic) getTimeLabel;
  final bool Function(dynamic) getIsProcessing;

  const YourTransformationsSection({
    super.key,
    required this.items,
    required this.onSeeAllTap,
    required this.onCardTap,
    required this.getSourceUrl,
    required this.getResultUrl,
    required this.getTimeLabel,
    required this.getIsProcessing,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            CustomText(
              text: 'your_transformation',
              size: 18.sp,
              weight: FontWeight.w600,
              color: AppColors.white,
            ),
            GestureDetector(
              onTap: onSeeAllTap,
              child: CustomText(
                text: 'see_all',
                size: 12.sp,
                weight: FontWeight.w600,
                color: AppColors.primary,
              ),
            ),
          ],
        ),
        Gap(14.h),
        SizedBox(
          height: 200.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            separatorBuilder: (_, __) => Gap(12.w),
            itemBuilder: (context, i) {
              final item = items[i];
              final statusColor = getIsProcessing(item)
                  ? Colors.pinkAccent
                  : AppColors.primary;

              return GestureDetector(
                onTap: () => onCardTap(item),
                child: Container(
                  width: 148.w,
                  clipBehavior: Clip.antiAlias,
                  decoration: BoxDecoration(
                    color: const Color(0xFF110D1E),
                    borderRadius: BorderRadius.circular(20.r),
                    border: Border.all(color: Colors.white10),
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: Image.network(
                          getResultUrl(item),
                          fit: BoxFit.cover,
                          width: double.infinity,
                          errorBuilder: (_, __, ___) => const SizedBox.shrink(),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(10.r),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              text: getTimeLabel(item),
                              size: 10.sp,
                              color: Colors.white38,
                            ),
                            Gap(4.h),
                            Row(
                              children: [
                                Container(
                                  width: 6,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    color: statusColor,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                                Gap(5.w),
                                CustomText(
                                  text: getIsProcessing(item)
                                      ? 'processing'
                                      : 'completed',
                                  size: 10.sp,
                                  color: statusColor,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
