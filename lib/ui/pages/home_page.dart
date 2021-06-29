import 'dart:math';

import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';
import 'package:portfolio/ui/widgets/favorite_technologies_presentation.dart';
import 'package:portfolio/ui/widgets/percent_bar/percent_bar.dart';
import 'package:portfolio/ui/widgets/ssmg_poster.dart';

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
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 10,
              ),
              child: SizedBox(
                width: 1000,
                child: Column(
                  children: <Widget>[
                    const CustomCard(
                      icon: Icons.person_outline,
                      title: 'About me',
                      child: SelectableText(
                        // ignore: lines_longer_than_80_chars
                        'I am SSMG, a guatemalan 17 years old guy, software engineer student, full stack developer and Flutter, Dart and Go lover.',
                      ),
                    ),
                    const FittedBox(
                      child: FavoriteTechnoloiesPresentation(),
                    ),
                    CustomCard(
                      icon: Icons.language_outlined,
                      title: 'Languages',
                      child: Column(
                        children: const <Widget>[
                          _Skill(
                            name: 'Spanish - Native',
                            percent: 1.0,
                          ),
                          _Skill(
                            name: 'English',
                            percent: 0.75,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomCard(
                      icon: Icons.hardware_outlined,
                      title: 'Skills',
                      child: Column(
                        children: const <Widget>[
                          _Skill(
                            name: 'Dart',
                            percent: 0.6,
                          ),
                          _Skill(
                            name: 'Flutter',
                            percent: 0.35,
                          ),
                          _Skill(
                            name: 'Go',
                            percent: 0.05,
                          ),
                          _Skill(
                            name: 'TypeScript',
                            percent: 0.75,
                          ),
                          _Skill(
                            name: 'Svelte',
                            percent: 0.5,
                          ),
                          _Skill(
                            name: 'Git',
                            percent: 0.30,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
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
  }) : super(key: key);

  final String name;
  final double percent;

  @override
  Widget build(BuildContext context) {
    final random = Random();
    final randomColor = Color.fromRGBO(
        random.nextInt(255), random.nextInt(255), random.nextInt(255), 1);
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
          color: randomColor,
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