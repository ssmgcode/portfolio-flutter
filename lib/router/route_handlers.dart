import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart' show Handler;
import 'package:portfolio/ui/views/main_view.dart';

/// Provides all handlers for routes definitions.
class RouteHandlers {
  /// Handler for root route.
  static final root = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        const MainView(),
  );
}
