import 'package:flutter/material.dart';

/// Contains the colors for the application.
class AppTheme {
// This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppTheme._();

  /// The accent color for the application.
  static final accentColor = Colors.blue.shade700;

  /// The color of brand.
  static const brandColor = Color.fromRGBO(15, 38, 54, 1);

  /// The main font used across the application.
  static const fontFamily = 'IBMPlexSans';

  static final _lightTheme = ThemeData(
    fontFamily: fontFamily,
    brightness: Brightness.light,
    primaryColorBrightness: Brightness.light,
    primaryColor: Colors.white,
    accentColor: accentColor,
    toggleableActiveColor: accentColor,
    scaffoldBackgroundColor: const Color.fromRGBO(248, 249, 250, 1),
    cardColor: Colors.white,
  );

  static final _darkTheme = ThemeData(
    fontFamily: fontFamily,
    brightness: Brightness.dark,
    primaryColorBrightness: Brightness.dark,
    primaryColor: const Color.fromRGBO(36, 37, 38, 1),
    accentColor: accentColor,
    toggleableActiveColor: accentColor,
    scaffoldBackgroundColor: const Color.fromRGBO(25, 26, 27, 1),
    cardColor: const Color.fromRGBO(36, 37, 38, 1),
  );

  /// Get the light theme.
  static ThemeData get lightTheme => _lightTheme;

  /// Get the dark theme.
  static ThemeData get darkTheme => _darkTheme;
}
