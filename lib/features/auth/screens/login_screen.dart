import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/features/auth/widgets/buttom_text.dart';
import 'package:neurina/features/auth/widgets/login_form.dart';
import 'package:neurina/features/auth/widgets/auth_header.dart';
import 'package:neurina/features/auth/widgets/login_social_buttons.dart';
import 'package:neurina/shared/or_divider.dart';

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
                          title: 'good_to_see_you',
                          gradientWord: 'again',
                          subtitle: 'sign_in_subtitle',
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
                  text: 'dont_have_account',
                  actionText: 'sign_up',
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
