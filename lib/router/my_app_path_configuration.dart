/// Determines what configuration has the application on its path.
class MyAppPathConfiguration {
  /// Sets the current application path configuration to home.
  const MyAppPathConfiguration.home() : _currentPage = 'home';

  /// Sets the current application path configuration to projects.
  const MyAppPathConfiguration.projects() : _currentPage = 'projects';

  /// Sets the current application path configuration to contact-me.
  const MyAppPathConfiguration.contactMe() : _currentPage = 'contact-me';

  /// Sets the current application path configuration to unknown.
  const MyAppPathConfiguration.unknown() : _currentPage = '404';

  final String _currentPage;

  /// Returns `true` if the current application path configuration is home.
  bool get isHome => _currentPage == 'home';

  /// Returns `true` if the current application path configuration is projects.
  bool get isProjects => _currentPage == 'projects';

  /// Returns `true` if the current application path configuration is
  /// contact-me.
  bool get isContactMe => _currentPage == 'contact-me';

  /// Returns `true` if the current application path configuration is unknown.
  bool get isUnknown => _currentPage == '404';

  /// Parses a url to an instance of [MyAppPathConfiguration] depending of the
  /// path segments and query parameters.
  static MyAppPathConfiguration parse(String url) {
    final uri = Uri.parse(url);

    // path: /
    if (uri.pathSegments.isEmpty) {
      return const MyAppPathConfiguration.home();
    }

    // path: /projects
    if (uri.pathSegments.first == 'projects') {
      return const MyAppPathConfiguration.projects();
    }

    // path: /contact-me
    if (uri.pathSegments.first == 'contact-me') {
      return const MyAppPathConfiguration.contactMe();
    }

    return const MyAppPathConfiguration.unknown();
  }
}
