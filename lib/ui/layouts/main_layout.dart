import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/router/router.dart';
import 'package:portfolio/services/navigation_service.dart';
import 'package:portfolio/ui/widgets/application_menu.dart';

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
        // Use a [Builder] to get the right context.
        title: Builder(
          builder: (BuildContext context) => SvgPicture.asset(
            'assets/ssmg-logo.svg',
            height: 30,
            color: DefaultTextStyle.of(context).style.color,
          ),
        ),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0),
          ),
        ),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              showModalBottomSheet(
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(10.0),
                  ),
                ),
                builder: (_) => const ApplicationMenu(),
              );
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
      ),
      body: Column(
        children: [
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
