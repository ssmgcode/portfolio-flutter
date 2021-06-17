import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';
import 'package:portfolio/ui/widgets/favorite_technologies_presentation.dart';

/// Widget to show my information and who I'm.
class PersonalInformation extends StatelessWidget {
  /// Widget to show my information and who I'm.
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const CustomCard(
            icon: Icons.person_outline,
            title: 'About me',
            child: Text(
              // ignore: lines_longer_than_80_chars
              'I am SSMG, a guatemalan 17 years old guy, software engineer student, full stack developer and Flutter, Dart and Go lover.',
            ),
          ),
          const FavoriteTechnoloiesPresentation(),
          CustomCard(
            icon: Icons.task_alt_rounded,
            title: 'Projects',
            child: Column(
              children: <Widget>[
                Container(
                  color: Colors.teal,
                  height: 50,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
