import 'package:flutter/material.dart';
import 'package:neurina/features/auth/screens/login_screen.dart';
import 'package:neurina/features/auth/screens/signup_screen.dart';
import 'package:neurina/features/welcome/screens/welcome_screen.dart';

class AppRoutes {
  static const String welcome = '/welcome';
  static const String login = '/login';
  static const String signup = '/signup';

  static Map<String, WidgetBuilder> get routes => {
        welcome: (_) => const WelcomeScreen(),
        login: (_) => const LoginScreen(),
        signup: (_) => const SignupScreen(),
      };

  static const String initialRoute = welcome;
}