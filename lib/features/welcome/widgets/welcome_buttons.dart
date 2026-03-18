import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/core/utils/pref_helper.dart';
import 'package:neurina/shared/custom_button.dart';

class WelcomeButtons extends StatelessWidget {
  const WelcomeButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onTap: () async {
            await PrefHelper.setLaunched();
            NavigationHelper.push(context, AppRoutes.signup);
          },
          title: 'get_started',
          suffixIcon: Icons.arrow_forward,
          height: 56,
          width: 1.sw,
          border: 50,
          color: AppColors.primary,
          textColor: AppColors.white,
        ),
        Gap(12.h),
        CustomButton(
          onTap: () async {
            await PrefHelper.setLaunched();
            NavigationHelper.push(context, AppRoutes.login);
          },
          title: 'already_have_account',
          height: 56,
          width: 1.sw,
          border: 50,
          color: Colors.transparent,
          textColor: AppColors.white,
          borderColor: AppColors.softBlue,
          borderWidth: 1.5,
        ),
      ],
    );
  }
}
