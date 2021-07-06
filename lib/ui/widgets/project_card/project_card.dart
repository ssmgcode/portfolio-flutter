import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/ui/widgets/project_card/footer.dart';
import 'package:portfolio/ui/widgets/project_card/technologies_tags.dart';

/// A custom card for presenting my projects.
class ProjectCard extends StatelessWidget {
  /// A custom card for presenting my projects.
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  /// The project the card displays.
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(
        bottom: 15.0,
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 15.0,
          horizontal: 10.0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              project.name,
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              project.description,
              style: const TextStyle(
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              'Technologies:',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            const SizedBox(
              height: 15,
            ),
            TechnologiesTags(
              technologies: project.technologies,
            ),
            if (project.repositoryUrl != null ||
                project.webUrl != null ||
                project.googlePlayStoreUrl != null ||
                project.appleAppStoreUrl != null)
              const SizedBox(
                height: 15,
              ),
            ProjectCardFooter(
              project: project,
            ),
          ],
        ),
      ),
    );
  }
}
