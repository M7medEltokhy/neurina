import 'package:shared_preferences/shared_preferences.dart';

class PrefHelpers {
  static const String _tokenKey = 'auth_token';
  static const String _isFirstLaunch = 'is_first_launch'; 

  static Future<void> saveToken(String token) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_tokenKey, token);
  }

  static Future<String?> getToken() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_tokenKey);
  }

  static Future<void> clearToken() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tokenKey);
  }

    static Future<bool> isFirstLaunch() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isFirstLaunch) ?? true;
  }

  static Future<void> setLaunched() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isFirstLaunch, false);
  }
}
