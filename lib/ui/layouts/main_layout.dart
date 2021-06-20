import 'package:flutter/material.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/router/router.dart';
import 'package:portfolio/services/navigation_service.dart';
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
      body: Column(
        children: [
          const CustomAppBar(),
          Expanded(
            child: Navigator(
              key: locator<NavigationService>().navigationKey,
              initialRoute: Flurorouter.rootRoute,
              onGenerateRoute: Flurorouter.router.generator,
            ),
          ),
        ],
      ),
    );
  }
}
