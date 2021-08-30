import 'package:flutter/material.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/footer/footer.dart';
import 'package:portfolio/ui/widgets/project_card/project_card.dart';

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
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 15.0,
                    ),
                    child: Text(
                      'Projects',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 15.0,
                    ),
                    child: SizedBox(
                      width: 700,
                      child: Column(
                        children: <Widget>[
                          for (Project project in PersonalInformation.projects)
                            ProjectCard(
                              project: project,
                            ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  const SizedBox(
                    height: 252,
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
