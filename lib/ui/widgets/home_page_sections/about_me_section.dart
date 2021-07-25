import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';

/// Creates the section that contains information about me.
class AboutMeHomePageSection extends StatelessWidget {
  /// Creates the section that contains information about me.
  const AboutMeHomePageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CustomCard(
      icon: Icons.person_outline,
      title: 'About me',
      child: Text(
        '''
I am SSMG, a guatemalan 17 years old guy, software engineer student, full stack developer and Flutter, Dart and Go lover.''',
      ),
    );
  }
}
