import 'package:flutter/material.dart';

/// Contains the colors for the application.
class AppTheme {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  AppTheme._();

  /// The icon of the application.
  static const logoSvg = 'assets/ssmg-logo.svg';

  /// The accent color for the application.
  static final _accentColor = Colors.blue.shade700;

  /// The color of brand.
  static const brandColor = Color.fromRGBO(15, 38, 54, 1);

  /// The main font used across the application.
  static const _fontFamily = 'IBMPlexSans';

  static const _darkPrimaryColor = Color.fromRGBO(36, 37, 38, 1);
  static const _lightPrimaryColor = Colors.white;

  /// Light theme of application.
  static final lightTheme = ThemeData(
    fontFamily: _fontFamily,
    brightness: Brightness.light,
    primaryColor: _lightPrimaryColor,
    accentColor: _accentColor,
    toggleableActiveColor: _accentColor,
    scaffoldBackgroundColor: const Color.fromRGBO(248, 249, 250, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: _lightPrimaryColor,
      elevation: 3,
    ),
    cardColor: _lightPrimaryColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: _lightPrimaryColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _lightPrimaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      actionTextColor: Colors.white,
    ),
  );

  /// Dark theme of application.
  static final darkTheme = ThemeData(
    fontFamily: _fontFamily,
    brightness: Brightness.dark,
    primaryColor: _darkPrimaryColor,
    accentColor: _accentColor,
    toggleableActiveColor: _accentColor,
    scaffoldBackgroundColor: const Color.fromRGBO(25, 26, 27, 1),
    appBarTheme: const AppBarTheme(
      backgroundColor: _darkPrimaryColor,
      elevation: 3,
    ),
    cardColor: _darkPrimaryColor,
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: _darkPrimaryColor,
    ),
    dialogTheme: const DialogTheme(
      backgroundColor: _darkPrimaryColor,
    ),
    snackBarTheme: const SnackBarThemeData(
      behavior: SnackBarBehavior.floating,
      actionTextColor: Colors.white,
    ),
  );
}
