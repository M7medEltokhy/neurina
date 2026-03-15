import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/core/utils/validators.dart';
import 'package:neurina/features/auth/cubit/auth_cubit.dart';
import 'package:neurina/features/auth/cubit/auth_state.dart';
import 'package:neurina/shared/custom_snack_bar.dart';
import 'package:neurina/shared/custom_text_field.dart';
import 'package:neurina/shared/gradient_button.dart';

class SignupForm extends StatefulWidget {
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
  State<SignupForm> createState() => _SignupFormState();
}

class _SignupFormState extends State<SignupForm> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: BlocConsumer<AuthCubit, AuthState>(
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
            children: [
              CustomTextField(
                hint: 'Name',
                isPassword: false,
                controller: widget.nameController,
                keyboardType: TextInputType.name,
                validator: AppValidators.validateName,
              ),
              Gap(16.h),
              CustomTextField(
                hint: 'Email',
                isPassword: false,
                controller: widget.emailController,
                keyboardType: TextInputType.emailAddress,
                validator: AppValidators.validateEmail,
              ),
              Gap(16.h),
              CustomTextField(
                hint: 'Password',
                isPassword: true,
                controller: widget.passwordController,
                validator: AppValidators.validatePassword,
              ),
              Gap(28.h),
              state is AuthLoading
                  ? const Center(child: CircularProgressIndicator())
                  : GradientButton(
                      title: 'Create Account',
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().signup(
                            name: widget.nameController.text.trim(),
                            email: widget.emailController.text.trim(),
                            password: widget.passwordController.text.trim(),
                          );
                        }
                      },
                    ),
            ],
          );
        },
      ),
    );
  }
}
