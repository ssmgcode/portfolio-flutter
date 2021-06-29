import 'package:flutter/material.dart';

/// Creates a percent bar depending on [percent].
class PercentBar extends StatelessWidget {
  /// Creates a percent bar depending on [percent].
  ///
  /// [percent] must be equal or greater than `0` and equal or less than `1`.
  const PercentBar({
    Key? key,
    required this.percent,
    this.color = Colors.green,
  })  : assert(percent >= 0.0 && percent <= 1.0),
        super(key: key);

  /// The percent of the colored percent bar.
  /// Must be equal or greater than `0` and equal or less than `1`.
  final double percent;

  /// The color used for the colored percent bar.
  /// Defaults to [Colors.green].
  final Color color;

  @override
  Widget build(BuildContext context) {
    final borderRadius = BorderRadius.circular(4.0);
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        return Container(
          height: 15.0,
          width: constraints.maxWidth,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: DefaultTextStyle.of(context).style.color!.withOpacity(0.1),
            borderRadius: borderRadius,
          ),
          child: Container(
            width: constraints.maxWidth * percent,
            decoration: BoxDecoration(
              color: color,
              borderRadius: borderRadius,
            ),
          ),
        );
      },
    );
  }
}
