import 'package:fluro/fluro.dart' show Handler;
import 'package:portfolio/ui/views/main_view.dart';
import 'package:portfolio/ui/views/projects_view.dart';

/// Provides all handlers for routes definitions.
class RouteHandlers {
  /// Handler for root route.
  static final root = Handler(
    handlerFunc: (_, __) => const MainView(),
  );

  /// Handler for projects route.
  static final projects = Handler(
    handlerFunc: (_, __) => const ProjectsView(),
  );
}
