import 'package:portfolio/models/technologies_enum.dart';
export './technologies_enum.dart';

/// The model of the projects to present in `ProjectsPage`.
class Project {
  /// The model of the projects to present in `ProjectsPage`.
  const Project({
    required this.description,
    required this.name,
    required this.technologies,
    this.appleAppStoreUrl,
    this.googlePlayStoreUrl,
    this.repositoryUrl,
    this.webUrl,
  });

  /// Name of the project.
  final String name;

  /// Optional description of the project.
  final String description;

  /// A list of the technologies used in the project.
  /// Typically, programming languages.
  final List<Technology> technologies;

  /// Optional url of the repository.
  final String? repositoryUrl;

  /// Optional url of the web site deployed.
  final String? webUrl;

  /// Optional url of the application in Google Play Store.
  final String? googlePlayStoreUrl;

  /// Optional url of the application in Apple AppStore.
  final String? appleAppStoreUrl;
}
