import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/features/profile/cubit/contact_us_cubit.dart';
import 'package:neurina/features/profile/cubit/contact_us_state.dart';
import 'package:neurina/features/profile/data/user_model.dart';
import 'package:neurina/features/profile/widgets/contact_us_user_info_card.dart';
import 'package:neurina/shared/custom_button.dart';
import 'package:neurina/shared/custom_snack_bar.dart';
import 'package:neurina/shared/custom_text.dart';
import 'package:neurina/shared/custom_text_field.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final _formKey = GlobalKey<FormState>();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _messageController.dispose();
    super.dispose();
  }

  void _onSend() {
    if (!_formKey.currentState!.validate()) return;
    context.read<ContactUsCubit>().sendMessage(
      name: widget.user.name,
      email: widget.user.email,
      message: _messageController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ContactUsCubit, ContactUsState>(
      listener: (context, state) {
        if (state is ContactUsLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is ContactUsSuccess) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar(state.message,type: SnackBarType.success));
          Navigator.pop(context);
        } else if (state is ContactUsFailure) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(customSnackBar(state.error));
        }
      },
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          backgroundColor: const Color(0xFF0D0B1E),
          appBar: AppBar(
            backgroundColor: const Color(0xFF0D0B1E),
            elevation: 0,
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios_new,
                color: Colors.white,
                size: 20.sp,
              ),
              onPressed: () => Navigator.pop(context),
            ),
            title: CustomText(
              text: 'contact_us',
              size: 20.sp,
              color: Colors.white,
              weight: FontWeight.bold,
            ),
          ),
          body: SafeArea(
            child: SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ContactUsUserInfoCard(
                      name: widget.user.name,
                      email: widget.user.email,
                    ),
                    Gap(24.h),
                    CustomTextField(
                      controller: _messageController,
                      hint: 'message',
                      isPassword: false,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'please_enter_message'.tr();
                        }
                        return null;
                      },
                    ),
                    Gap(40.h),
                    CustomButton(
                      onTap: _onSend,
                      title: 'send',
                      height: 52,
                      width: double.infinity,
                      border: 50,
                      color: AppColors.primary,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
