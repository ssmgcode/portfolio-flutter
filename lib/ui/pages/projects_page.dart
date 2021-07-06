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
      body: CustomScrollView(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        slivers: <Widget>[
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: Center(
                    child: Text(
                      'Projects',
                      style: Theme.of(context).textTheme.headline3,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (_, int index) => Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: SizedBox(
                  width: 1000,
                  child: ProjectCard(
                    project: myProjects[index],
                  ),
                ),
              ),
              childCount: myProjects.length,
            ),
          ),
          const SliverList(
            delegate: SliverChildListDelegate.fixed(
              <Widget>[
                SizedBox(
                  height: 25,
                ),
              ],
            ),
          ),
          const SliverFillRemaining(
            hasScrollBody: false,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: SizedBox(
                height: 250,
                child: Footer(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
