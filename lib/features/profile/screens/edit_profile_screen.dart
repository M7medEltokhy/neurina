import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/features/profile/cubit/profile_cubit.dart';
import 'package:neurina/features/profile/cubit/update_profile_cubit.dart';
import 'package:neurina/features/profile/cubit/update_profile_state.dart';
import 'package:neurina/features/profile/data/user_model.dart';
import 'package:neurina/features/profile/widgets/edit_profile_avatar_picker.dart';
import 'package:neurina/features/profile/widgets/edit_profile_confirm_dialog.dart';
import 'package:neurina/shared/custom_button.dart';
import 'package:neurina/shared/custom_snack_bar.dart';
import 'package:neurina/shared/custom_text.dart';
import 'package:neurina/shared/custom_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key, required this.user});
  final UserModel user;

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  File? _avatar;

  @override
  void initState() {
    super.initState();
    _nameController.text = widget.user.name;
  }

  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }

  Future<void> _pickAvatar() async {
    final picker = ImagePicker();
    final file = await picker.pickImage(source: ImageSource.gallery);
    if (file != null) setState(() => _avatar = File(file.path));
  }

  void _onSave() {
    if (!_formKey.currentState!.validate()) return;
    showDialog(
      context: context,
      builder: (_) => EditProfileConfirmDialog(
        onConfirm: () => context.read<UpdateProfileCubit>().updateProfile(
              name: _nameController.text,
              profilePicturePath: _avatar?.path,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<UpdateProfileCubit, UpdateProfileState>(
      listener: (context, state) {
        if (state is UpdateProfileLoading) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (_) => const Center(child: CircularProgressIndicator()),
          );
        } else if (state is UpdateProfileSuccess) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          context.read<ProfileCubit>().getProfile();
          Navigator.pop(context);
        } else if (state is UpdateProfileFailure) {
          if (Navigator.of(context, rootNavigator: true).canPop()) {
            Navigator.of(context, rootNavigator: true).pop();
          }
          ScaffoldMessenger.of(context).showSnackBar(customSnackBar(state.error));
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
              icon: Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20.sp),
              onPressed: () => Navigator.pop(context),
            ),
            title: CustomText(
              text: 'edit_profile',
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
                  children: [
                    EditProfileAvatarPicker(
                      profilePictureUrl: widget.user.profilePictureUrl,
                      avatar: _avatar,
                      onTap: _pickAvatar,
                    ),
                    Gap(32.h),
                    CustomTextField(
                      controller: _nameController,
                      hint: 'name',
                      isPassword: false,
                    ),
                    Gap(40.h),
                    CustomButton(
                      onTap: _onSave,
                      title: 'save_changes',
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