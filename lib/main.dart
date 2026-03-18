import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:neurina/core/constants/app_colors.dart';
import 'package:neurina/core/routes/app_routes.dart';
import 'package:neurina/core/utils/pref_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  final bool firstLaunch = await PrefHelper.isFirstLaunch();
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('ar')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: NeurinaApp(
        initialRoute: firstLaunch ? AppRoutes.welcome : AppRoutes.login,
      ),
    ),
  );
}

class NeurinaApp extends StatelessWidget {
  const NeurinaApp({super.key, required this.initialRoute});
  final String initialRoute;

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(430, 932),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        title: 'Neurina',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
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
