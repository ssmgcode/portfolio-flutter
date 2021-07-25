import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';
import 'package:portfolio/ui/widgets/skill_bar/skill_bar.dart';

/// Creates the section that contains information about languages I speak.
class LanguagesHomePageSection extends StatelessWidget {
  /// Creates the section that contains information about languages I speak.
  const LanguagesHomePageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      icon: Icons.language_outlined,
      title: 'Languages',
      child: Column(
        children: const <Widget>[
          Skill(
            name: 'Spanish - Native',
            percent: 1.0,
            color: Colors.deepPurple,
          ),
          Skill(
            name: 'English',
            percent: 0.75,
            color: Colors.purple,
          ),
        ],
      ),
    );
  }
}
