import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';
import 'package:portfolio/ui/widgets/skill_bar/skill_bar.dart';

/// Creates the section that contains my skills.
class SkillsHomePageSection extends StatelessWidget {
  /// Creates the section that contains my skills.
  const SkillsHomePageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      icon: Icons.hardware_outlined,
      title: 'Skills',
      child: Column(
        children: const <Widget>[
          Skill(
            name: 'Dart',
            percent: 0.6,
            color: Color.fromRGBO(1, 87, 155, 1),
          ),
          Skill(
            name: 'Flutter',
            percent: 0.40,
            color: Color.fromRGBO(69, 209, 253, 1),
          ),
          Skill(
            name: 'Go',
            percent: 0.15,
            color: Color.fromRGBO(0, 172, 215, 1),
          ),
          Skill(
            name: 'TypeScript',
            percent: 0.75,
            color: Color.fromRGBO(43, 116, 137, 1),
          ),
          Skill(
            name: 'Svelte',
            percent: 0.5,
            color: Color.fromRGBO(255, 62, 0, 1),
          ),
          Skill(
            name: 'Git',
            percent: 0.30,
            color: Color.fromRGBO(244, 77, 39, 1),
          ),
          Skill(
            name: 'Rust',
            percent: 0.05,
            color: Color.fromRGBO(255, 200, 50, 1),
          ),
        ],
      ),
    );
  }
}
