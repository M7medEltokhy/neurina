import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/utils/pref_helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final bool firstLaunch = await PrefHelpers.isFirstLaunch();
  runApp(NeurinaApp(initialRoute: firstLaunch ? AppRoutes.welcome : AppRoutes.login));
}

class NeurinaApp extends StatelessWidget {
  const NeurinaApp({super.key, required this.initialRoute});
final String initialRoute;
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
        initialRoute: initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
