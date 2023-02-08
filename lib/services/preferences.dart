import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static Future<void> setFirstLaunched() async {
    final preferences = await SharedPreferences.getInstance();
    await preferences.setBool('showOnboarding', true);
  }

  static Future<bool?> getFirstLaunched() async {
    final preferences = await SharedPreferences.getInstance();
    return preferences.getBool('showOnboarding');
  }

  static Future<void> removeFirstLaunched() async {
    final preferences = await SharedPreferences.getInstance();
    preferences.remove('showOnboarding');
  }
}
