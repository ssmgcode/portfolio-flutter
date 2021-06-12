import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/presentation.dart';

/// Displays the root page of the portfolio.
class MainView extends StatelessWidget {
  /// Displays the root page of the portfolio.
  const MainView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const <Widget>[
        Presentation(),
      ],
    );
  }
}
