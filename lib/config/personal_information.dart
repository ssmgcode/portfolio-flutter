import 'package:portfolio/models/project_model.dart';

/// Contains all my personal information, such as Github profile, done projects
/// and more.
class PersonalInformation {
  // This class is not meant to be instantiated or extended; this constructor
  // prevents instantiation and extension.
  PersonalInformation._();

  /// My Github profile url.
  static const githubProfileUrl = 'https://github.com/ssmgcode';

  /// My YouTube profile url.
  static const youtubeProfileUrl =
      'https://youtube.com/channel/UCbIJqlO9H1FWaeV_BQ9nPvw';

  /// My Instagram profile url.
  static const instagramProfileUrl = 'https://instagram.com/ssmgcode';

  /// This project repository.
  static const projectRepositoryUrl = '$githubProfileUrl/portfolio';

  /// All my projects based on the [Project] model.
  static const List<Project> projects = [
    Project(
      name: 'SSMG Code Portfolio',
      description: '''
My personal portfolio built on Flutter and available for Web and Android.''',
      technologies: <Technology>[
        Technology.dart,
        Technology.flutter,
        Technology.go,
      ],
      repositoryUrl: PersonalInformation.projectRepositoryUrl,
      webUrl: 'https://ssmgcode-portfolio.vercel.app',
    ),
    Project(
      name: 'Antojitos del Parque landing page',
      description: '''
Landing page to show location, schedule, menu, social media and more information relating to the brand.''',
      technologies: <Technology>[
        Technology.svelte,
      ],
      repositoryUrl:
          'https://github.com/ssmgcode/antojitos-del-parque-landing-page',
      webUrl: 'https://antojitosdelparque.com',
    ),
  ];
}
