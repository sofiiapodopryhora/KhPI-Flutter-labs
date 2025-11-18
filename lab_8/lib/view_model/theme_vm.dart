import 'package:flutter/material.dart';
import '../repository/theme_repository.dart';

class ThemeViewModel extends ChangeNotifier {
  final ThemeRepository _repo = ThemeRepository();

  bool _isDark = false;
  bool get isDark => _isDark;

  ThemeViewModel() {
    _loadTheme();
  }

  Future<void> _loadTheme() async {
    _isDark = await _repo.loadTheme();
    notifyListeners();
  }

  void toggleTheme() {
    _isDark = !_isDark;
    _repo.saveTheme(_isDark);
    notifyListeners();
  }

  ThemeMode get themeMode => _isDark ? ThemeMode.dark : ThemeMode.light;
}
