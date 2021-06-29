import 'package:flutter/material.dart';
import 'package:portfolio/router/my_app_path_configuration.dart';
import 'package:portfolio/ui/pages/home_page.dart';
import 'package:portfolio/ui/pages/projects_page.dart';
import 'package:portfolio/ui/pages/unknown_page.dart';
import 'package:provider/provider.dart';

/// The page manager for the router.
class RouterPageManager extends ChangeNotifier {
  // |- Implementation of singleton pattern to avoid re instance this class and
  // reset pages list
  RouterPageManager._internal();

  /// The page manager for the router.
  factory RouterPageManager() => _singleton;

  static final RouterPageManager _singleton = RouterPageManager._internal();
  // ->

  final List<Page> _pages = [
    MaterialPage(
      key: UniqueKey(),
      name: '/',
      child: const HomePage(),
    ),
  ];

  /// List of pages of the application.
  List<Page> get pages => List.unmodifiable(_pages);

  /// Current path of application depending of [MyAppPathConfiguration].
  MyAppPathConfiguration get currentPath =>
      MyAppPathConfiguration.parse(_pages.last.name!);

  /// Retrieves the instance of RouterPageManager from the widgets tree.
  static RouterPageManager of(BuildContext context) =>
      Provider.of<RouterPageManager>(
        context,
        listen: false,
      );

  /// Removes the page which did pop from the pages list.
  void didPop(RouteSettings settings) {
    _pages.remove(settings);
    notifyListeners();
  }

  /// Deletes all pages except home page.
  void openHomePage() {
    _pages.removeWhere((page) => page.name != '/');
    notifyListeners();
  }

  /// Add projects page to pages list.
  void openProjectsPage() {
    _pages.add(
      MaterialPage(
        key: UniqueKey(),
        name: '/projects',
        child: const ProjectsPage(),
      ),
    );
    notifyListeners();
  }

  /// Add unknown page to pages list.
  void openUnknownPage() {
    _pages.add(
      MaterialPage(
        key: UniqueKey(),
        name: '/404',
        child: const UnknownPage(),
      ),
    );
    notifyListeners();
  }

  /// Updates internal state of pages when external url changes.
  Future<void> setNewRoutePath(MyAppPathConfiguration configuration) async {
    if (configuration.isUnknown) {
      openUnknownPage();
    } else if (configuration.isProjects) {
      openProjectsPage();
    } else if (configuration.isHome) {
      openHomePage();
    }
  }
}
