import 'package:flutter/material.dart';
import 'package:portfolio/router/my_app_path_configuration.dart';

/// The implementation of [RouteInformationParser] for my application.
class MyAppRouteInformationParser
    extends RouteInformationParser<MyAppPathConfiguration> {
  @override
  Future<MyAppPathConfiguration> parseRouteInformation(
    RouteInformation routeInformation,
  ) async {
    return MyAppPathConfiguration.parse(routeInformation.location!);
  }

  @override
  RouteInformation? restoreRouteInformation(
    MyAppPathConfiguration configuration,
  ) {
    if (configuration.isUnknown) {
      return const RouteInformation(
        location: '/404',
      );
    }

    if (configuration.isHome) {
      return const RouteInformation(
        location: '/',
      );
    }

    if (configuration.isProjects) {
      return const RouteInformation(
        location: '/projects',
      );
    }

    if (configuration.isContactMe) {
      return const RouteInformation(
        location: '/contact-me',
      );
    }

    return super.restoreRouteInformation(configuration);
  }
}
