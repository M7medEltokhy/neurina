import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/shared/custom_text_field.dart';
import 'package:neurina/shared/gradient_button.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
  });

  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          hint: 'Name',
          isPassword: false,
          controller: nameController,
          keyboardType: TextInputType.name,
        ),
        Gap(16.h),
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
        Gap(28.h),
        GradientButton(title: 'Create Account', onTap: () {}),
      ],
    );
  }
}