import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Neurina',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: AppColors.scaffold,
          textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: Colors.purple.withOpacity(0.9),
            cursorColor: AppColors.softBlue,
            selectionColor: AppColors.softBlue.withOpacity(0.5),
          ),
        ),
        home: Scaffold(
          body: Center(child: Text('Hello, Neurina!')),
        ),
      ),
    );
  }
}
