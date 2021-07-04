import 'package:flutter/material.dart';

/// This controls the [ScaffoldMessengerState] and has methods to show custom
/// [SnackBar]s.
class SnackBarService {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  SnackBarService._();

  /// The key of the current [ScaffoldMessengerState].
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  /// Builds a custom snackbar for base.
  static SnackBar _buildBaseSnackBar({
    Color? backgroundColor,
    IconData? icon,
    SnackBarAction? action,
    required Color color,
    required String message,
  }) =>
      SnackBar(
        backgroundColor: backgroundColor,
        behavior: SnackBarBehavior.floating,
        action: action,
        content: Row(
          children: <Widget>[
            if (icon != null)
              Icon(
                icon,
                color: color,
              ),
            if (icon != null)
              const SizedBox(
                width: 10,
              ),
            Text(
              message,
              style: TextStyle(
                color: color,
              ),
            ),
          ],
        ),
      );

  /// Shows an snackbar with information motive.
  static void showInformationSnackBar({
    SnackBarAction? action,
    required String message,
  }) {
    final snackBar = _buildBaseSnackBar(
      action: action,
      backgroundColor: Colors.blue,
      color: Colors.white,
      icon: Icons.info_outline_rounded,
      message: message,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  /// Shows an snackbar with error motive.
  static void showErrorSnackBar({
    SnackBarAction? action,
    required String message,
  }) {
    final snackBar = _buildBaseSnackBar(
      color: Colors.white,
      message: message,
      action: action,
      backgroundColor: Colors.red,
      icon: Icons.error_outline_rounded,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
