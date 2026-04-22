import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/core/utils/pref_helper.dart';
import 'package:neurina/features/profile/cubit/profile_cubit.dart';
import 'package:neurina/features/profile/widgets/build_settings_item.dart';
import 'package:neurina/features/profile/widgets/profile_header.dart';
import 'package:neurina/features/profile/widgets/profile_section_title.dart';
import 'package:neurina/features/profile/widgets/profile_settings_list.dart';
import 'package:neurina/shared/custom_button.dart';
import 'package:neurina/shared/custom_text.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<ProfileCubit>().getProfile();
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Gap(32.h),
                const ProfileHeader(),
                Gap(24.h),
                CustomButton(
                  onTap: () {},
                  title: 'edit_profile',
                  height: 50,
                  width: double.infinity,
                  border: 14,
                  color: AppColors.primary,
                ),
                Gap(32.h),
                ProfileSectionTitle(title: 'settings'.tr()),
                Gap(10.h),
                const ProfileSettingsList(),
                const Divider(color: Colors.white10, height: 40),
                BuildSettingsItem(
                  icon: Icons.logout,
                  title: 'logout'.tr(),
                  isLogout: true,
                  onTap: () {
                    _handleLogout(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void _handleLogout(BuildContext context) async {
  await showDialog(
    context: context,
    builder: (context) => AlertDialog(
      backgroundColor: AppColors.background,
      surfaceTintColor: AppColors.background,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: const BorderSide(color: Colors.white30, width: 1.5),
      ),
      icon: const Icon(Icons.logout, color: Colors.redAccent),
      title: CustomText(
        text: 'logout'.tr(),
        color: Colors.white,
        size: 18.sp,
        weight: FontWeight.bold,
      ),
      content: CustomText(
        text: 'logout_confirmation'.tr(),
        color: Colors.white70,
        size: 14.sp,
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: CustomText(
            text: 'cancel'.tr(),
            color: Colors.white70,
            weight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () async {
            await PrefHelper.clearToken();
            NavigationHelper.pushAndClearStack(context, AppRoutes.login);
          },
          child: CustomText(
            text: 'logout'.tr(),
            color: Colors.redAccent,
            weight: FontWeight.w600,
          ),
        ),
      ],
    ),
  );
}
