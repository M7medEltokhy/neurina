import 'package:flutter/material.dart';

class NavigationHelper {
  static void push(BuildContext context, String route, {Object? arguments}) {
    Navigator.pushNamed(context, route, arguments: arguments);
  }

  static void pushReplacement(BuildContext context, String route, {Object? arguments}) {
    Navigator.pushReplacementNamed(context, route, arguments: arguments);
  }

  static void pushAndClearStack(BuildContext context, String route) {
    Navigator.pushNamedAndRemoveUntil(context, route, (_) => false);
  }

  static void pop(BuildContext context) {
    Navigator.pop(context);
  }
}