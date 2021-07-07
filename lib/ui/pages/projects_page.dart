import 'package:flutter/material.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/models/technologies_enum.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/footer/footer.dart';
import 'package:portfolio/ui/widgets/project_card/project_card.dart';

/// All my projects based on the [Project] model.
const List<Project> myProjects = [
  Project(
    name: 'SSMG Code Portfolio',
    description:
        'My personal portfolio built on Flutter and available for Web and Android.',
    technologies: [
      Technology.dart,
      Technology.flutter,
      Technology.go,
    ],
    repositoryUrl: PersonalInformation.projectRepositoryUrl,
    webUrl: 'https://ssmgcode-portfolio.vercel.app',
  ),
];

/// Displays the root view of the portfolio.
class ProjectsPage extends StatelessWidget {
  /// Displays the root view of the portfolio.
  const ProjectsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: LayoutBuilder(
        builder: (_, BoxConstraints boxConstraints) => SingleChildScrollView(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: boxConstraints.maxHeight,
            ),
            child: IntrinsicHeight(
              child: Column(
                children: <Widget>[
                  Text(
                    'Projects',
                    style: Theme.of(context).textTheme.headline3,
                  ),
                  for (Project project in myProjects)
                    ProjectCard(
                      project: project,
                    ),
                  const Spacer(),
                  const SizedBox(
                    height: 250,
                    child: Footer(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
