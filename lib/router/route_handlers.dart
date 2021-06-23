import 'package:flutter/material.dart' show BuildContext;
import 'package:fluro/fluro.dart' show Handler;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/route/route_cubit.dart';
import 'package:portfolio/ui/views/main_view.dart';
import 'package:portfolio/ui/views/projects_view.dart';

/// Provides all handlers for routes definitions.
class RouteHandlers {
  /// General handler for all routes.
  static final general = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
      final routeName = params['page']![0];
      BlocProvider.of<RouteCubit>(context!).setCurrentRoute(routeName);
      if (routeName == '/') {
        return const MainView();
      } else if (routeName == 'projects') {
        return const ProjectsView();
      }
    },
  );
}
