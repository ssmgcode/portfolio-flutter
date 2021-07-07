import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

/// Contains the icons from Boxicons used in the application.
class Boxicons {
  Boxicons._();

  /// Logo of Github.
  static const bxl_github = _BoxiconsRenderer(icon: 'assets/github.svg');

  /// Logo of Google Play Store.
  static const bxl_play_store =
      _BoxiconsRenderer(icon: 'assets/play-store.svg');

  /// Logo of Apple App Store.
  static const bxl_apple = _BoxiconsRenderer(icon: 'assets/apple.svg');
}

class _BoxiconsRenderer extends StatelessWidget {
  const _BoxiconsRenderer({
    Key? key,
    required this.icon,
    this.color,
    this.height,
  }) : super(key: key);

  /// The name of the SVG asset to use as an icon.
  final String icon;
  final Color? color;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      icon,
      color: color ?? DefaultTextStyle.of(context).style.color,
      height: height,
    );
  }
}
