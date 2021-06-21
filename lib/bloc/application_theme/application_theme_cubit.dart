import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:portfolio/shared_preferences/user_preferences.dart';

/// Cubit to provide the theme mode to the main root of the application.
class ApplicationThemeModeCubit extends Cubit<ThemeMode> {
  /// Cubit to provide the theme mode to the main root of the application.
  ApplicationThemeModeCubit() : super(UserPreferences().theme);

  /// Sets a theme mode and emit the event to its widgets.
  void setThemeMode(ThemeMode themeMode) {
    UserPreferences().theme = themeMode;
    emit(themeMode);
  }
}
