import 'package:flutter/material.dart';

/// A custom navigation service.
class NavigationService {
  /// This key keeps the state and reference to my custom navigator.
  final GlobalKey<NavigatorState> navigationKey = GlobalKey<NavigatorState>();

  /// Used to navigate to [routeName] through the application.
  /// Similar to `Navigator.pushNamed(context, routeName)`.
  Future navigateTo(String routeName) {
    return navigationKey.currentState!.pushNamed(routeName);
  }

  /// Used to go back from a route.
  /// Similar to `Navigator.pop(context)`.
  void goBack() {
    return navigationKey.currentState!.pop();
  }
}
