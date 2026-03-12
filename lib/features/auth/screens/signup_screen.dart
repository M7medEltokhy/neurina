import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/features/auth/widgets/buttom_text.dart';
import 'package:neurina/features/auth/widgets/login_header.dart';
import 'package:neurina/features/auth/widgets/login_social_buttons.dart';
import 'package:neurina/features/auth/widgets/or_divider.dart';
import 'package:neurina/features/auth/widgets/signup_form.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _nameController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _nameController.dispose();
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
                          title: 'Create your\n',
                          gradientWord: 'Identity ✦',
                          subtitle: 'Your face. Your story. Let\'s begin. ✦',
                        ),
                        Gap(40.h),
                        SignupForm(
                          emailController: _emailController,
                          passwordController: _passwordController,
                          nameController: _nameController,
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
                  onTap: () => NavigationHelper.pushReplacement(
                    context,
                    AppRoutes.login,
                  ),
                  text: 'Already have an account? ',
                  actionText: 'Sign In',
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
