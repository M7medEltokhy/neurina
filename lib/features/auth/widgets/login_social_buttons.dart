import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_button.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onTap: () {},
          title: 'Continue with Google',
          height: 56,
          width: 1.sw,
          border: 50,
          color: AppColors.white,
          textColor: AppColors.black,
          borderWidth: 0,
        ),
        Gap(12.h),
        CustomButton(
          onTap: () {},
          title: 'Continue with Github',
          height: 56,
          width: 1.sw,
          border: 50,
          color: AppColors.nearBlack,
          textColor: AppColors.white,
          borderColor: AppColors.softBlue,
          borderWidth: 1,
        ),
      ],
    );
  }
}
