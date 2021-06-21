import 'package:flutter/material.dart';

/// Contains the colors for the application.
class AppTheme {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppTheme._();

  /// The accent color for the application.
  static final _accentColor = Colors.blue.shade700;

  /// The color of brand.
  static const brandColor = Color.fromRGBO(15, 38, 54, 1);

  /// The main font used across the application.
  // static const _fontFamily = 'IBMPlexSans';
  static const _fontFamily = 'Inter';

  /// Light theme of application.
  static final lightTheme = ThemeData(
    fontFamily: _fontFamily,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: _accentColor,
    toggleableActiveColor: _accentColor,
    scaffoldBackgroundColor: const Color.fromRGBO(248, 249, 250, 1),
    cardColor: Colors.white,
  );

  /// Dark theme of application.
  static final darkTheme = ThemeData(
    fontFamily: _fontFamily,
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(36, 37, 38, 1),
    accentColor: _accentColor,
    toggleableActiveColor: _accentColor,
    scaffoldBackgroundColor: const Color.fromRGBO(25, 26, 27, 1),
    cardColor: const Color.fromRGBO(36, 37, 38, 1),
  );
}
