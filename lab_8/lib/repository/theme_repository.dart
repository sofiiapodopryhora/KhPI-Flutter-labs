import 'package:shared_preferences/shared_preferences.dart';

class ThemeRepository {
  static const _key = "app_theme"; // true = dark, false = light

  Future<bool> loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_key) ?? false; // false = світла тема
  }

  Future<void> saveTheme(bool isDark) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_key, isDark);
  }
}
