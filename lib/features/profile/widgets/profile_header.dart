import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/features/profile/cubit/profile_cubit.dart';
import 'package:neurina/features/profile/cubit/profile_state.dart';
import 'package:neurina/shared/custom_text.dart';

class ProfileHeader extends StatelessWidget {
  const ProfileHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is ProfileLoading) {
          return const _ProfileHeaderSkeleton();
        }

        if (state is ProfileFailure) {
          return Center(
            child: CustomText(
              text: state.error,
              size: 14.sp,
              color: Colors.redAccent,
            ),
          );
        }

        final user = state is ProfileSuccess ? state.user : null;

        return Row(
          children: [
            Container(
              padding: EdgeInsets.all(3.r),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Color(0xFF6C63FF), Colors.purpleAccent],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              ),
              child: CircleAvatar(
                radius: 45.r,
                backgroundColor: const Color(0xFF1A1730),
                child: ClipOval(
                  child: user?.profilePictureUrl.isNotEmpty == true
                      ? CachedNetworkImage(
                          imageUrl: user!.profilePictureUrl,
                          width: 90.r,
                          height: 90.r,
                          fit: BoxFit.cover,
                          placeholder: (_, __) =>
                              const CircularProgressIndicator(
                                color: Colors.purpleAccent,
                                strokeWidth: 2,
                              ),
                          errorWidget: (_, __, ___) =>
                              const AssetImage(
                                    "assets/images/profile/profile.png",
                                  )
                                  as Widget,
                        )
                      : Image.asset(
                          "assets/images/profile/profile.png",
                          width: 90.r,
                          height: 90.r,
                          fit: BoxFit.cover,
                        ),
                ),
              ),
            ),
            Gap(16.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: user?.name ?? '---',
                    size: 20.sp,
                    color: Colors.white,
                    weight: FontWeight.bold,
                  ),
                  Gap(4.h),
                  CustomText(
                    text: user?.email ?? '---',
                    size: 13.sp,
                    color: Colors.white54,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}

class _ProfileHeaderSkeleton extends StatelessWidget {
  const _ProfileHeaderSkeleton();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 96.r,
          height: 96.r,
          decoration: BoxDecoration(
            color: Colors.white.withOpacity(0.08),
            shape: BoxShape.circle,
          ),
        ),
        Gap(16.w),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 120.w,
              height: 16.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.08),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
            Gap(8.h),
            Container(
              width: 180.w,
              height: 12.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.05),
                borderRadius: BorderRadius.circular(8.r),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
