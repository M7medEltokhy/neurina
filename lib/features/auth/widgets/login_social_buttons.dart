import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/features/auth/cubit/auth_cubit.dart';
import 'package:neurina/shared/custom_button.dart';

class LoginSocialButtons extends StatelessWidget {
  const LoginSocialButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomButton(
          onTap: () => context.read<AuthCubit>().signInWithGoogle(),
          title: 'continue_with_google',
          height: 56,
          width: 1.sw,
          border: 50,
          color: AppColors.white,
          textColor: AppColors.black,
          borderWidth: 0,
          prefixWidget: Image.asset(
            'assets/auth/google.png',
            height: 30.h,
            width: 30.w,
          ),
        ),
        Gap(12.h),
        CustomButton(
          onTap: () {},
          title: 'continue_with_github',
          height: 56,
          width: 1.sw,
          color: AppColors.nearBlack,
          textColor: AppColors.white,
          borderColor: AppColors.softBlue,
          borderWidth: 1,
          border: 50,
          prefixWidget: CircleAvatar(
            backgroundColor: AppColors.white,
            radius: 18.r,
            child: Image.asset(
              'assets/auth/github.png',
              height: 36.h,
              width: 36.w,
            ),
          ),
        ),
      ],
    );
  }
}
