import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/percent_bar/percent_bar.dart';

/// Creates a skill bar using [PercentBar]
class Skill extends StatelessWidget {
  /// Creates a skill bar using [PercentBar].
  const Skill({
    Key? key,
    required this.name,
    required this.percent,
    this.color,
  }) : super(key: key);

  /// Name of skill.
  final String name;

  /// Percent of skill. It must be between 0 and 1.
  final double percent;

  /// An optional color for percent bar.
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: TextStyle(
              color: DefaultTextStyle.of(context).style.color!.withOpacity(0.6),
              // fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        PercentBar(
          percent: percent,
          color: color,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            '${percent * 100}%',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
