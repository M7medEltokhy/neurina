import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/shared/custom_text.dart';
import 'package:neurina/shared/custom_text_field.dart';
import 'package:neurina/shared/gradient_button.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        CustomTextField(
          hint: 'Email',
          isPassword: false,
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
        ),
        Gap(16.h),
        CustomTextField(
          hint: 'Password',
          isPassword: true,
          controller: passwordController,
        ),
        Gap(12.h),
        GestureDetector(
          onTap: () {},
          child: CustomText(
            text: 'Forgot Password?',
            size: 14.sp,
            color: AppColors.primary,
            weight: FontWeight.w500,
          ),
        ),
        Gap(28.h),
        GradientButton(title: 'Sign In', onTap: () {}),
      ],
    );
  }
}