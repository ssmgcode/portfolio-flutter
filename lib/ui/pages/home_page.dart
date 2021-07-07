import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/router/page_manager.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';
import 'package:portfolio/ui/widgets/favorite_technologies_presentation.dart';
import 'package:portfolio/ui/widgets/footer/footer.dart';
import 'package:portfolio/ui/widgets/percent_bar/percent_bar.dart';
import 'package:portfolio/ui/widgets/ssmg_poster.dart';
import 'package:portfolio/utils/open_url_with_copy_to_clipboard_fallback.dart'
    as utils;

/// Displays the root view of the portfolio.
class HomePage extends StatelessWidget {
  /// Displays the root view of the portfolio.
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            const SSMGPoster(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10.0,
              ),
              child: SizedBox(
                width: 1000,
                child: Column(
                  children: const <Widget>[
                    CustomCard(
                      icon: Icons.person_outline,
                      title: 'About me',
                      child: SelectableText(
                        // ignore: lines_longer_than_80_chars
                        'I am SSMG, a guatemalan 17 years old guy, software engineer student, full stack developer and Flutter, Dart and Go lover.',
                      ),
                    ),
                    FittedBox(
                      child: FavoriteTechnoloiesPresentation(),
                    ),
                    _LanguagesSection(),
                    SizedBox(
                      height: 25,
                    ),
                    _SkillsSection(),
                    SizedBox(
                      height: 25,
                    ),
                    _ProjectsSection(),
                  ],
                ),
              ),
            ),
            const Footer(),
          ],
        ),
      ),
    );
  }
}

class _LanguagesSection extends StatelessWidget {
  const _LanguagesSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      icon: Icons.language_outlined,
      title: 'Languages',
      child: Column(
        children: const <Widget>[
          _Skill(
            name: 'Spanish - Native',
            percent: 1.0,
            color: Colors.deepPurple,
          ),
          _Skill(
            name: 'English',
            percent: 0.75,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}

class _SkillsSection extends StatelessWidget {
  const _SkillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      icon: Icons.hardware_outlined,
      title: 'Skills',
      child: Column(
        children: const <Widget>[
          _Skill(
            name: 'Dart',
            percent: 0.6,
            color: Color.fromRGBO(1, 87, 155, 1),
          ),
          _Skill(
            name: 'Flutter',
            percent: 0.35,
            color: Color.fromRGBO(69, 209, 253, 1),
          ),
          _Skill(
            name: 'Go',
            percent: 0.05,
            color: Color.fromRGBO(0, 172, 215, 1),
          ),
          _Skill(
            name: 'TypeScript',
            percent: 0.75,
            color: Color.fromRGBO(43, 116, 137, 1),
          ),
          _Skill(
            name: 'Svelte',
            percent: 0.5,
            color: Color.fromRGBO(255, 62, 0, 1),
          ),
          _Skill(
            name: 'Git',
            percent: 0.30,
            color: Color.fromRGBO(244, 77, 39, 1),
          ),
        ],
      ),
    );
  }
}

class _ProjectsSection extends StatelessWidget {
  const _ProjectsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Projects',
      icon: Icons.task_alt_outlined,
      actionIcon: Boxicons.bxl_github,
      actionName: 'Visit',
      onActionPressed: () async {
        await utils.openUrlWithCopyToClipboardFallback(
          PersonalInformation.githubProfileUrl,
        );
      },
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: <Widget>[
            ElevatedButton(
              onPressed: () => RouterPageManager.of(context).openProjectsPage(),
              style: ElevatedButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
              child: const Text('Explore my projects'),
            ),
            const SizedBox(
              height: 10,
            ),
            OutlinedButton(
              onPressed: () {},
              style: OutlinedButton.styleFrom(
                primary: Theme.of(context).accentColor,
              ),
              child: const Text('Contact me'),
            ),
          ],
        ),
      ),
    );
  }
}

class _Skill extends StatelessWidget {
  const _Skill({
    Key? key,
    required this.name,
    required this.percent,
    this.color,
  }) : super(key: key);

  final String name;
  final double percent;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          child: Text(
            name,
            style: TextStyle(
              color: DefaultTextStyle.of(context).style.color!.withOpacity(0.6),
              // fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
        ),
        const SizedBox(
          height: 5,
        ),
        PercentBar(
          percent: percent,
          color: color,
        ),
        const SizedBox(
          height: 5,
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Text(
            '${percent * 100}%',
            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
