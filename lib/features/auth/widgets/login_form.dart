import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/features/auth/cubit/auth_cubit.dart';
import 'package:neurina/features/auth/cubit/auth_state.dart';
import 'package:neurina/shared/custom_snack_bar.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthError) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar(state.message));
        }
        if (state is AuthSuccess) {
          NavigationHelper.pushReplacement(context, AppRoutes.home);
        }
      },
      builder: (context, state) {
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
            state is AuthLoading
                ? const Center(child: CircularProgressIndicator())
                : GradientButton(
                    title: 'Sign In',
                    onTap: () {
                      context.read<AuthCubit>().login(
                        email: emailController.text.trim(),
                        password: passwordController.text.trim(),
                      );
                    },
                  ),
          ],
        );
      },
    );
  }
}
