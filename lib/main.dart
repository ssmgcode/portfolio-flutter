import 'package:flutter/material.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/router/router.dart';
import 'package:portfolio/services/navigation_service.dart';
import 'package:portfolio/ui/layouts/main_layout.dart';

void main() {
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

/// Main application enter point for UI.
class MyApp extends StatelessWidget {
  /// Constant constructor for main application enter point for UI.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Primary light color for the application: background,
    /// buttons backgrounds, etc.
    const backgroundColorLight = Color.fromRGBO(248, 249, 250, 1);

    /// Primary dark color for the application: background,
    /// buttons backgrunds, etc.
    const backgroundColorDark = Color.fromRGBO(36, 37, 38, 1);

    /// The base theme data.
    final baseTheme = ThemeData(
      fontFamily: 'IBMPlexSans',
      accentColor: const Color(0xff0f2636),
      accentColorBrightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        centerTitle: true,
      ),
    );

    /// The implementation of [baseTheme] with adjustment for light theme.
    final lightTheme = baseTheme.copyWith(
      primaryColor: Colors.black,
      backgroundColor: backgroundColorLight,
      scaffoldBackgroundColor: backgroundColorLight,
      brightness: Brightness.light,
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Colors.black,
        ),
        brightness: Brightness.light,
        backgroundColor: backgroundColorLight,
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      cardColor: Colors.white,
    );

    /// The implementation of [baseTheme] with adjustment for dark theme.
    final darkTheme = baseTheme.copyWith(
      primaryColor: Colors.white,
      backgroundColor: backgroundColorDark,
      scaffoldBackgroundColor: backgroundColorDark,
      brightness: Brightness.dark,
      appBarTheme: const AppBarTheme(
        actionsIconTheme: IconThemeData(
          color: Colors.white,
        ),
        brightness: Brightness.dark,
        backgroundColor: backgroundColorDark,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
      cardColor: const Color.fromRGBO(25, 26, 27, 1),
    );

    return MaterialApp(
      title: 'SSMG Code',
      theme: lightTheme,
      // darkTheme: darkTheme,
      home: const MainLayout(),
    );
  }
}
