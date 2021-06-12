import 'package:flutter/material.dart';
import 'package:portfolio/router/router.dart';
import 'package:portfolio/ui/layouts/main_layout.dart';

void main() {
  Flurorouter.configureRoutes();
  runApp(const MyApp());
}

/// Main application enter point for UI.
class MyApp extends StatelessWidget {
  /// Constant constructor for main application enter point for UI.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SSMG Code',
      theme: ThemeData(
        fontFamily: 'IBMPlexSans',
      ),
      initialRoute: Flurorouter.rootRoute,
      onGenerateRoute: Flurorouter.router.generator,
      builder: (BuildContext context, Widget? child) => MainLayout(
        child: child ?? Container(),
      ),
    );
  }
}
