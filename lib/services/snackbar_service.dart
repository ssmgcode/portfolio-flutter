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
    Color? color,
    IconData? icon,
    SnackBarAction? action,
    required String message,
  }) =>
      SnackBar(
        backgroundColor: backgroundColor,
        action: action,
        content: Row(
          children: <Widget>[
            if (icon != null)
              Icon(
                icon,
                color: color ?? Colors.white,
              ),
            if (icon != null)
              const SizedBox(
                width: 10,
              ),
            Expanded(
              child: Text(
                message,
                style: TextStyle(
                  color: color,
                ),
              ),
            ),
          ],
        ),
      );

  /// Shows an snackbar with information motive.
  static void showInformationSnackBar({
    SnackBarAction? action,
    bool isColored = true,
    required String message,
  }) {
    final snackBar = _buildBaseSnackBar(
      action: action,
      backgroundColor: isColored ? Colors.blue : null,
      color: isColored ? Colors.white : null,
      icon: Icons.info_outline_rounded,
      message: message,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  /// Shows an snackbar with warning motive.
  static void showWarningSnackBar({
    SnackBarAction? action,
    bool isColored = true,
    required String message,
  }) {
    final snackBar = _buildBaseSnackBar(
      action: action,
      backgroundColor: isColored ? Colors.amber.shade800 : null,
      color: isColored ? Colors.white : null,
      icon: Icons.warning_amber_rounded,
      message: message,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  /// Shows an snackbar with success motive.
  static void showSuccessSnackBar({
    SnackBarAction? action,
    bool isColored = true,
    required String message,
  }) {
    final snackBar = _buildBaseSnackBar(
      action: action,
      backgroundColor: isColored ? Colors.green : null,
      color: isColored ? Colors.white : null,
      icon: Icons.check_circle_outline_rounded,
      message: message,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  /// Shows an snackbar with error motive.
  static void showErrorSnackBar({
    SnackBarAction? action,
    bool isColored = true,
    required String message,
  }) {
    final snackBar = _buildBaseSnackBar(
      action: action,
      backgroundColor: isColored ? Colors.red : null,
      color: isColored ? Colors.white : null,
      icon: Icons.error_outline_rounded,
      message: message,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  /// Allows creating a custom snackbar based on [_buildBaseSnackBar].
  static void showCustomSnackBar({
    Color? backgroundColor,
    IconData? icon,
    SnackBarAction? action,
    required Color color,
    required String message,
  }) {
    final snackBar = _buildBaseSnackBar(
      action: action,
      backgroundColor: backgroundColor,
      color: color,
      icon: icon,
      message: message,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
