import 'package:fluro/fluro.dart';
import 'package:portfolio/router/route_handlers.dart';

/// Custom router to configure and define routes of the entire application.
///
/// The [configureRoutes] method must be called before UI application
/// initialization.
class Flurorouter {
  /// Object to define, configure and manage all routes.
  static final router = FluroRouter();

  // Routes
  /// Root route of the application.
  static const String rootRoute = '/';

  /// Projects route of the application.
  static const String projectsRoute = '/projects';

  /// Configures all routes and defines them with their respective handler.
  ///
  /// Must be called before UI application initialization.
  static void configureRoutes() {
    router
      ..define(
        rootRoute,
        handler: RouteHandlers.root,
      )
      ..define(
        projectsRoute,
        handler: RouteHandlers.projects,
      );
  }
}
