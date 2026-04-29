import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:neurina/features/auth/cubit/auth_cubit.dart';
import 'package:neurina/features/auth/data/auth_repo_impl.dart';
import 'package:neurina/features/auth/screens/login_screen.dart';
import 'package:neurina/features/auth/screens/signup_screen.dart';
import 'package:neurina/features/welcome/screens/welcome_screen.dart';
import 'package:neurina/root.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';
  static const String home = '/home';
  static const String sourceImg = '/sourceImg';

  static Map<String, WidgetBuilder> get routes => {
    welcome: (_) => const WelcomeScreen(),
    login: (_) => BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: const LoginScreen(),
    ),
    signup: (_) => BlocProvider(
      create: (context) => AuthCubit(AuthRepoImpl()),
      child: const SignupScreen(),
    ),
    home: (_) => const Root(),
  };

  static const String initialRoute = welcome;
}
