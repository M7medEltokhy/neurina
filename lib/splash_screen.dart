import 'package:flutter/material.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/routes/navigation_helper.dart';
import 'package:neurina/core/utils/pref_helper.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigate();
  }

  Future<void> _navigate() async {
    final bool firstLaunch = await PrefHelper.isFirstLaunch();
    
    if (!mounted) return;

    NavigationHelper.pushAndClearStack(
      context,
      firstLaunch ? AppRoutes.welcome : AppRoutes.login,
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}