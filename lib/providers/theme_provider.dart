// lib/providers/theme_provider.dart

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import '../core/theme/theme.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _themeBox = 'authBox';
  static const String _themeKey = 'isDarkMode';

  bool _isDarkMode = false;
  bool get isDarkMode => _isDarkMode;

  ThemeProvider() {
    _loadTheme();
  }

  void toggleTheme(bool isOn) {
    _isDarkMode = isOn;
    _saveTheme(isOn);
    notifyListeners();
  }

  Future<void> _loadTheme() async {
    var box = Hive.box(_themeBox);
    _isDarkMode = box.get(_themeKey, defaultValue: false);
    notifyListeners();
  }

  Future<void> _saveTheme(bool isDarkMode) async {
    var box = Hive.box(_themeBox);
    await box.put(_themeKey, isDarkMode);
  }
}
