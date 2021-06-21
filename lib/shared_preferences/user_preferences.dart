import 'package:flutter/material.dart' show ThemeMode;
import 'package:shared_preferences/shared_preferences.dart';

/// The central class to manage user preferences persistenly.
class UserPreferences {
  UserPreferences._internal();

  /// Creates a singleton instance of this class to centralize all preferences.
  factory UserPreferences() => UserPreferences._instance;

  late SharedPreferences _preferences;

  static final UserPreferences _instance = UserPreferences._internal();

  /// Get last status of theme set by user.
  ThemeMode get theme {
    final lastThemeSet = _preferences.getString('theme');
    switch (lastThemeSet) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }

  /// Set a new status for theme used by application.
  set theme(ThemeMode themeMode) {
    final String themeModeToSet;
    switch (themeMode) {
      case ThemeMode.light:
        themeModeToSet = 'light';
        break;
      case ThemeMode.dark:
        themeModeToSet = 'dark';
        break;
      default:
        themeModeToSet = 'system';
        break;
    }
    _preferences.setString('theme', themeModeToSet);
  }

  /// Read preferences set by user from SharedPreferences.
  Future<void> initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }
}
