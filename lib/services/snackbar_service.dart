import 'package:flutter/material.dart';

/// This controls the [ScaffoldMessengerState] and has methods to show custom
/// [SnackBar]s.
class SnackBarService {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  SnackBarService._();

  /// The key of the current [ScaffoldMessengerState].
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  /// Shows a custom snack bar with red background and an error icon.
  static void showErrorSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
      backgroundColor: Colors.red,
      behavior: SnackBarBehavior.floating,
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }

  /// Shows a custom snack bar with blue background and an information icon.
  static void showInformationSnackBar(String message) {
    final snackBar = SnackBar(
      backgroundColor: Colors.blue,
      behavior: SnackBarBehavior.floating,
      content: Row(
        children: <Widget>[
          const Icon(
            Icons.info_outline_rounded,
            color: Colors.white,
          ),
          const SizedBox(
            width: 15,
          ),
          Text(
            message,
            style: const TextStyle(
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
    messengerKey.currentState!.showSnackBar(snackBar);
  }
}
