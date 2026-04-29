import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:image_picker/image_picker.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/features/upload/widgets/upload_camera_btn.dart';
import 'package:neurina/features/upload/widgets/upload_cta.dart';
import 'package:neurina/features/upload/widgets/upload_photo_preview.dart';
import 'package:neurina/features/upload/widgets/upload_steps_indicator.dart';
import 'package:neurina/features/upload/widgets/upload_tips.dart';
import 'package:neurina/features/upload/widgets/upload_top_bar.dart';
import 'package:neurina/features/upload/widgets/upload_zone.dart';
import 'package:neurina/shared/or_divider.dart';

class UploadSourceScreen extends StatefulWidget {
  final VoidCallback onNext;
  const UploadSourceScreen({super.key, required this.onNext});

  @override
  State<UploadSourceScreen> createState() => _UploadSourceScreenState();
}

class _UploadSourceScreenState extends State<UploadSourceScreen> {
  String? _uploadedImagePath;
  bool get _hasPhoto => _uploadedImagePath != null;

  void _pickImage({required ImageSource source}) async {
    final picked = await ImagePicker().pickImage(source: source);
    if (picked != null) setState(() => _uploadedImagePath = picked.path);
  }

  void _removePhoto() => setState(() => _uploadedImagePath = null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Gap(16.h),
              const UploadTopBar(),
              Gap(24.h),
              const UploadStepsIndicator(),
              Gap(20.h),
              const UploadTips(),
              Gap(16.h),
              _hasPhoto
                  ? UploadPhotoPreview(imagePath: _uploadedImagePath!, onRemove: _removePhoto)
                  : UploadZone(onTap: () => _pickImage(source: ImageSource.gallery)),
              Gap(20.h),
              const OrDivider(),
              Gap(16.h),
              UploadCameraBtn(onTap: () => _pickImage(source: ImageSource.camera)),
              const Spacer(),
              UploadCTA(hasPhoto: _hasPhoto, onTap: _hasPhoto ? widget.onNext : null),
              Gap(20.h),
            ],
          ),
        ),
      ),
    );
  }
}