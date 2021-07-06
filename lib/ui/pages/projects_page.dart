import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/models/technologies_enum.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/footer/footer.dart';

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
                  child: _ProjectCard(
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

class _ProjectCard extends StatelessWidget {
  const _ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

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
            _TechnologiesManager(
              technologies: project.technologies,
            ),
            if (project.repositoryUrl != null ||
                project.webUrl != null ||
                project.googlePlayStoreUrl != null ||
                project.appleAppStoreUrl != null)
              const SizedBox(
                height: 15,
              ),
            _ProjectCardFooter(
              project: project,
            ),
          ],
        ),
      ),
    );
  }
}

class _TechnologiesManager extends StatelessWidget {
  const _TechnologiesManager({
    Key? key,
    required this.technologies,
  }) : super(key: key);

  final List<Technology> technologies;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Row(
        children: <Widget>[
          for (Technology technology in technologies) ...<Widget>[
            if (technology == Technology.dart)
              const _TechnologyTag(
                name: 'Dart',
                color: Colors.blue,
              )
            else if (technology == Technology.flutter)
              _TechnologyTag(
                name: 'Flutter',
                color: Colors.blue.shade400,
              )
            else if (technology == Technology.go)
              _TechnologyTag(
                name: 'Go',
                color: Colors.blue.shade800,
              )
            else if (technology == Technology.nodejs)
              const _TechnologyTag(
                name: 'Node.js',
                color: Colors.green,
              )
            else if (technology == Technology.typescript)
              const _TechnologyTag(
                name: 'TypeScript',
                color: Colors.blueGrey,
              )
            else if (technology == Technology.svelte)
              _TechnologyTag(
                name: 'Svelte',
                color: Colors.amber.shade900,
              ),
            const SizedBox(
              width: 5,
            ),
          ],
        ],
      ),
    );
  }
}

class _TechnologyTag extends StatelessWidget {
  const _TechnologyTag({
    Key? key,
    required this.color,
    required this.name,
  }) : super(key: key);

  final Color color;
  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(50.0),
        color: color.withOpacity(0.3),
        border: Border.all(
          color: color,
        ),
      ),
      child: Text(name),
    );
  }
}

class _ProjectCardFooter extends StatelessWidget {
  const _ProjectCardFooter({
    Key? key,
    required this.project,
  }) : super(key: key);

  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (project.repositoryUrl != null)
          SizedBox(
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                primary: DefaultTextStyle.of(context).style.color,
                onPrimary: Theme.of(context).primaryColor,
              ),
              icon: SvgPicture.asset(
                'assets/github.svg',
                color: Theme.of(context).primaryColor,
              ),
              label: const Text('Visit on Github'),
            ),
          ),
        Row(
          children: <Widget>[
            if (project.webUrl != null)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    primary: DefaultTextStyle.of(context).style.color,
                  ),
                  icon: const Icon(Icons.language_outlined),
                  label: const Text('Web'),
                ),
              ),
            const SizedBox(
              width: 5,
            ),
            if (project.googlePlayStoreUrl != null)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    primary: DefaultTextStyle.of(context).style.color,
                  ),
                  icon: const Icon(Boxicons.bxl_play_store),
                  label: const Text('Get'),
                ),
              ),
            const SizedBox(
              width: 5,
            ),
            if (project.appleAppStoreUrl != null)
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    primary: DefaultTextStyle.of(context).style.color,
                  ),
                  icon: const Icon(Boxicons.bxl_apple),
                  label: const Text('Get'),
                ),
              ),
          ],
        ),
      ],
    );
  }
}
