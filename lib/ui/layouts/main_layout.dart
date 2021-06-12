import 'package:flutter/material.dart';

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
      body: SafeArea(
        child: Column(
          children: <Widget>[
            // TODO: Implement app navigation bar
            const Text('App Navigation Bar'),
            Expanded(
              child: child!,
            ),
            // TODO: Implement footer
            const Text('Footer'),
          ],
        ),
      ),
    );
  }
}
