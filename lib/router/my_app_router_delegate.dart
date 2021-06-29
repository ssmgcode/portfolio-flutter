import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:portfolio/router/my_app_path_configuration.dart';
import 'package:portfolio/router/page_manager.dart';

/// The implementation of [RouterDelegate] for my application.
class MyAppRouterDelegate extends RouterDelegate<MyAppPathConfiguration>
    with
        ChangeNotifier,
        PopNavigatorRouterDelegateMixin<MyAppPathConfiguration> {
  /// The implementation of [RouterDelegate] for my application.
  MyAppRouterDelegate() {
    _routerPageManager.addListener(notifyListeners);
  }

  final _routerPageManager = RouterPageManager();
  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  GlobalKey<NavigatorState>? get navigatorKey => _navigatorKey;

  @override
  MyAppPathConfiguration? get currentConfiguration =>
      _routerPageManager.currentPath;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: _routerPageManager,
      child: Consumer<RouterPageManager>(
        builder: (
          _,
          RouterPageManager routerPageManager,
          __,
        ) =>
            Navigator(
          pages: List.of(routerPageManager.pages),
          onPopPage: _onPopPage,
        ),
      ),
    );
  }

  @override
  Future<void> setNewRoutePath(MyAppPathConfiguration configuration) async {
    await _routerPageManager.setNewRoutePath(configuration);
  }

  bool _onPopPage(Route route, result) {
    final didPop = route.didPop(result);
    if (!didPop) {
      return false;
    }
    _routerPageManager.didPop(route.settings);
    return true;
  }
}
