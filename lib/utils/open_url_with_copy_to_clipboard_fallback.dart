import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:portfolio/services/snackbar_service.dart';
import 'package:url_launcher/url_launcher.dart';

/// Tries to open [url] with system handler.
/// If it is not possible, it tries to copy to clipboard [url].
/// If it is not possible, it shows a custom [SnackBar] with [url].
Future<void> openUrlWithCopyToClipboardFallback(String url) async {
  final canOpenUrl = await canLaunch(url);
  if (canOpenUrl) {
    await launch(url);
    return;
  }
  try {
    await Clipboard.setData(
      ClipboardData(
        text: url,
      ),
    );
    SnackBarService.showInformationSnackBar(
      message: 'URL copied to clipboard',
      action: SnackBarAction(
        label: 'Dismiss',
        onPressed: () {},
      ),
    );
  } catch (error) {
    SnackBarService.showInformationSnackBar(
      message: url,
      isColored: false,
    );
  }
}
