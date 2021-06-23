import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/bloc/route/route_cubit.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/router/router.dart';
import 'package:portfolio/services/navigation_service.dart';
import 'package:portfolio/ui/widgets/application_menu.dart';
import 'package:portfolio/ui/widgets/dropdown_application_menu.dart';

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
    return WillPopScope(
      onWillPop: () async {
        final routeCubit = BlocProvider.of<RouteCubit>(context);
        if (routeCubit.state != '/') {
          await locator<NavigationService>().navigateTo('/');
          return false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          // Use a [Builder] to get the right context.
          title: Builder(
            builder: (BuildContext context) => MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => locator<NavigationService>().navigateTo('/'),
                child: SvgPicture.asset(
                  'assets/ssmg-logo.svg',
                  height: 30,
                  color: DefaultTextStyle.of(context).style.color,
                ),
              ),
            ),
          ),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10.0),
            ),
          ),
          actions: <Widget>[
            if (kIsWeb) ...[
              DropdownApplicationMenu()
            ] else ...[
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    builder: (_) => const ApplicationMenu(),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(10.0),
                      ),
                    ),
                  );
                },
                icon: const Icon(Icons.more_horiz),
              ),
            ],
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
      ),
    );
  }
}
