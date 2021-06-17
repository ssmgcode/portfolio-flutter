import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/ui/widgets/custom_app_bar.dart';

/// Displays a [Scaffold], with a body with a custom bar navigation, a footer
/// and a [Expanded] widget for a child.
class MainLayout extends StatelessWidget {
  /// Displays a [Scaffold], with a body with a custom bar navigation, a footer
  /// and a [Expanded] widget for a child.
  const MainLayout({
    Key? key,
    this.child,
  }) : super(key: key);

  /// The child contained by a [Expanded] widget.
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(
            left: 8.0,
          ),
          child: SvgPicture.asset(
            'assets/ssmg-logo.svg',
            height: 35,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        /* child: Column(
          children: <Widget>[
            SizedBox(
              width: 800,
              child: child!,
            ),
            const Text('Footer'),
          ],
        ), */
        child: Column(
          children: <Widget>[
            Expanded(child: child!),
          ],
        ),
      ),
    );
  }
}
