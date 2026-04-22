// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:gap/gap.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:neurina/core/constants/app_colors.dart';
// import 'package:neurina/features/profile/cubit/profile_cubit.dart';
// import 'package:neurina/features/profile/cubit/update_profile_cubit.dart';
// import 'package:neurina/features/profile/cubit/update_profile_state.dart';
// import 'package:neurina/features/profile/data/user_model.dart';
// import 'package:neurina/shared/custom_button.dart';
// import 'package:neurina/shared/custom_snack_bar.dart';
// import 'package:neurina/shared/custom_text.dart';
// import 'package:neurina/shared/custom_text_field.dart';

// class EditProfileScreen extends StatefulWidget {
//   const EditProfileScreen({super.key, required this.user});
//   final UserModel user;

//   @override
//   State<EditProfileScreen> createState() => _EditProfileScreenState();
// }

// class _EditProfileScreenState extends State<EditProfileScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   // final _emailController = TextEditingController();
//   // final _passwordController = TextEditingController();
//   File? _avatar;

//   @override
//   void initState() {
//     super.initState();
//     _nameController.text = widget.user.name;
//     // _emailController.text = widget.user.email;
//   }

//   @override
//   void dispose() {
//     _nameController.dispose();
//     // _emailController.dispose();
//     // _passwordController.dispose();
//     super.dispose();
//   }

//   Future<void> _pickAvatar() async {
//     final picker = ImagePicker();
//     final file = await picker.pickImage(source: ImageSource.gallery);
//     if (file != null) setState(() => _avatar = File(file.path));
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocListener<UpdateProfileCubit, UpdateProfileState>(
//       listener: (context, state) {
//         if (state is UpdateProfileLoading) {
//           showDialog(
//             context: context,
//             barrierDismissible: false,
//             builder: (_) => const Center(child: CircularProgressIndicator()),
//           );
//         } else if (state is UpdateProfileSuccess) {
//           if (Navigator.of(context, rootNavigator: true).canPop()) {
//             Navigator.of(context, rootNavigator: true).pop();
//           }
//           context.read<ProfileCubit>().getProfile();
//           Navigator.pop(context);
//         } else if (state is UpdateProfileFailure) {
//           if (Navigator.of(context, rootNavigator: true).canPop()) {
//             Navigator.of(context, rootNavigator: true).pop();
//           }
//           ScaffoldMessenger.of(
//             context,
//           ).showSnackBar(customSnackBar(state.error));
//         }
//       },
//       child: GestureDetector(
//         onTap: () => FocusScope.of(context).unfocus(),
//         child: Scaffold(
//           backgroundColor: const Color(0xFF0D0B1E),
//           appBar: AppBar(
//             backgroundColor: const Color(0xFF0D0B1E),
//             elevation: 0,
//             centerTitle: true,
//             leading: IconButton(
//               icon: Icon(
//                 Icons.arrow_back_ios_new,
//                 color: Colors.white,
//                 size: 20.sp,
//               ),
//               onPressed: () => Navigator.pop(context),
//             ),
//             title: CustomText(
//               text: 'edit_profile',
//               size: 20.sp,
//               color: Colors.white,
//               weight: FontWeight.bold,
//             ),
//           ),
//           body: SafeArea(
//             child: SingleChildScrollView(
//               padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   children: [
//                     _buildAvatarPicker(),
//                     Gap(32.h),
//                     CustomTextField(
//                       controller: _nameController,
//                       hint: 'name',
//                       isPassword: false,
//                     ),
//                     // Gap(16.h),
//                     // CustomTextField(
//                     //   controller: _emailController,
//                     //   hint: 'email',
//                     //   isPassword: false,
//                     //   keyboardType: TextInputType.emailAddress,
//                     // ),
//                     // Gap(16.h),
//                     // CustomTextField(
//                     //   controller: _passwordController,
//                     //   hint: 'new_password',
//                     //   isPassword: true,
//                     //   validator: (value) {
//                     //     if (value != null &&
//                     //         value.isNotEmpty &&
//                     //         value.length < 8) {
//                     //       return 'password_too_short'.tr();
//                     //     } else if (value != null &&
//                     //         value.isNotEmpty &&
//                     //         !RegExp(
//                     //           r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
//                     //         ).hasMatch(value)) {
//                     //       return 'password_requirements'.tr();
//                     //     }
//                     //     return null;
//                     //   },
//                     // ),
//                     Gap(40.h),
//                     CustomButton(
//                       onTap: _onSave,
//                       title: 'save_changes',
//                       height: 52,
//                       width: double.infinity,
//                       border: 50,
//                       color: AppColors.primary,
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildAvatarPicker() {
//     ImageProvider imageProvider;
//     if (_avatar != null) {
//       imageProvider = FileImage(_avatar!);
//     } else if (widget.user.profilePictureUrl.isNotEmpty) {
//       imageProvider = NetworkImage(widget.user.profilePictureUrl);
//     } else {
//       imageProvider = const AssetImage("assets/images/profile/profile.png");
//     }

//     return Center(
//       child: Stack(
//         children: [
//           Container(
//             padding: EdgeInsets.all(3.r),
//             decoration: BoxDecoration(
//               gradient: const LinearGradient(
//                 colors: [Color(0xFF6C63FF), Colors.purpleAccent],
//                 begin: Alignment.topLeft,
//                 end: Alignment.bottomRight,
//               ),
//               shape: BoxShape.circle,
//             ),
//             child: CircleAvatar(
//               radius: 55.r,
//               backgroundColor: const Color(0xFF1A1730),
//               backgroundImage: imageProvider,
//             ),
//           ),
//           Positioned(
//             bottom: 4,
//             right: 4,
//             child: GestureDetector(
//               onTap: _pickAvatar,
//               child: Container(
//                 padding: EdgeInsets.all(8.r),
//                 decoration: BoxDecoration(
//                   color: AppColors.primary,
//                   shape: BoxShape.circle,
//                   border: Border.all(color: const Color(0xFF0D0B1E), width: 2),
//                 ),
//                 child: Icon(Icons.camera_alt, color: Colors.white, size: 16.sp),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   void _onSave() {
//     if (!_formKey.currentState!.validate()) return;

//     showDialog(
//       context: context,
//       builder: (_) => AlertDialog(
//         backgroundColor: const Color(0xFF1A1730),
//         surfaceTintColor: Colors.transparent,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(16.r),
//           side: const BorderSide(color: Colors.white10, width: 1),
//         ),
//         title: CustomText(
//           text: 'save_changes',
//           color: Colors.white,
//           size: 18.sp,
//           weight: FontWeight.bold,
//         ),
//         content: CustomText(
//           text: 'save_changes_confirmation',
//           color: Colors.white54,
//           size: 14.sp,
//         ),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: CustomText(
//               text: 'cancel',
//               color: Colors.white38,
//               weight: FontWeight.w600,
//             ),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               context.read<UpdateProfileCubit>().updateProfile(
//                 name: _nameController.text,
//                 profilePicturePath: _avatar?.path,
//               );
//             },
//             child: CustomText(
//               text: 'save',
//               color: AppColors.primary,
//               weight: FontWeight.w600,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
