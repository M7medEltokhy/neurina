import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:neurina/features/upload/screens/upload_source_screen.dart';
import 'package:neurina/features/home/widgets/home_header.dart';
import 'package:neurina/features/home/widgets/transformation_card.dart';
import 'package:neurina/features/home/widgets/your_transformations_section.dart';

class HomeScreen extends StatefulWidget {
  final VoidCallback onSeeAllTap;
  const HomeScreen({super.key, required this.onSeeAllTap});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, dynamic>> fakeTransformations = [
    {
      'source': {
        'original_image_url': 'https://randomuser.me/api/portraits/women/1.jpg',
        'created_at': '2026-04-29T10:30:00.000000',
        'status': 'preprocessed',
      },
      'translated': {
        'processed_image_url':
            'https://randomuser.me/api/portraits/women/2.jpg',
        'status': 'translation_completed',
      },
    },
    {
      'source': {
        'original_image_url': 'https://randomuser.me/api/portraits/men/1.jpg',
        'created_at': '2026-04-28T14:15:00.000000',
        'status': 'preprocessed',
      },
      'translated': {
        'processed_image_url': 'https://randomuser.me/api/portraits/men/2.jpg',
        'status': 'translation_completed',
      },
    },
    {
      'source': {
        'original_image_url': 'https://randomuser.me/api/portraits/women/3.jpg',
        'created_at': '2026-04-28T09:00:00.000000',
        'status': 'preprocessed',
      },
      'translated': {
        'processed_image_url':
            'https://randomuser.me/api/portraits/women/4.jpg',
        'status': 'processing', // isProcessing = true
      },
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            Gap(40.h),
            HomeHeader(),
            Gap(20.h),
            TransformationCard(
              onStartTap: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => UploadSourceScreen(onNext: () {}),
                ),
              ),
            ),
            Gap(20.h),
            YourTransformationsSection(
              items: fakeTransformations,
              onSeeAllTap: widget.onSeeAllTap,
              onCardTap: (pair) {},
              getSourceUrl: (pair) =>
                  pair['source']['original_image_url'] ?? '',
              getResultUrl: (pair) =>
                  pair['translated']['processed_image_url'] ?? '',
              getTimeLabel: (pair) {
                final dt = DateTime.parse(pair['source']['created_at']);
                final now = DateTime.now();
                final diff = now.difference(dt).inDays;
                if (diff == 0)
                  return 'Today, ${DateFormat('h:mm a').format(dt)}';
                if (diff == 1)
                  return 'Yesterday, ${DateFormat('h:mm a').format(dt)}';
                return DateFormat('EEE, h:mm a').format(dt);
              },
              getIsProcessing: (pair) =>
                  pair['translated']['status'] != 'translation_completed',
            ),
          ],
        ),
      ),
    );
  }
}
