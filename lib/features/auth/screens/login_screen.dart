import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/features/auth/widgets/buttom_text.dart';
import 'package:neurina/features/auth/widgets/login_form.dart';
import 'package:neurina/features/auth/widgets/login_header.dart';
import 'package:neurina/features/auth/widgets/login_social_buttons.dart';
import 'package:neurina/features/auth/widgets/or_divider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.nearBlack,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.w),
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Gap(60.h),
                        const AuthHeader(
                          title: 'Good to see\nyou ',
                          gradientWord: 'Again ✦',
                          subtitle: 'Your face. Your identity. Sign in. ✦',
                        ),
                        Gap(40.h),
                        LoginForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                        ),
                        Gap(32.h),
                        const OrDivider(),
                        Gap(24.h),
                        const LoginSocialButtons(),
                      ],
                    ),
                  ),
                ),
                BottomText(
                  onTap: () => NavigationHelper.pushReplacement(context, AppRoutes.signup),
                  text: 'Don\'t have an account? ',
                  actionText: 'Sign Up',
                ),
                Gap(24.h),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
