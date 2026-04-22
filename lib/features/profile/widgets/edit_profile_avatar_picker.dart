import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';

class EditProfileAvatarPicker extends StatelessWidget {
  const EditProfileAvatarPicker({
    super.key,
    required this.profilePictureUrl,
    required this.avatar,
    required this.onTap,
  });

  final String profilePictureUrl;
  final File? avatar;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    ImageProvider imageProvider;
    if (avatar != null) {
      imageProvider = FileImage(avatar!);
    } else if (profilePictureUrl.isNotEmpty) {
      imageProvider = NetworkImage(profilePictureUrl);
    } else {
      imageProvider = const AssetImage("assets/images/profile/profile.png");
    }

    return Center(
      child: Stack(
        children: [
          Container(
            padding: EdgeInsets.all(3.r),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                colors: [Color(0xFF6C63FF), Colors.purpleAccent],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 55.r,
              backgroundColor: const Color(0xFF1A1730),
              backgroundImage: imageProvider,
            ),
          ),
          Positioned(
            bottom: 4,
            right: 4,
            child: GestureDetector(
              onTap: onTap,
              child: Container(
                padding: EdgeInsets.all(8.r),
                decoration: BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                  border: Border.all(color: const Color(0xFF0D0B1E), width: 2),
                ),
                child: Icon(Icons.camera_alt, color: Colors.white, size: 16.sp),
              ),
            ),
          ),
        ],
      ),
    );
  }
}