import 'package:flutter/material.dart';
import 'package:portfolio/ui/widgets/contact_me_button/contact_me_button.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';

/// Creates the section that contains methods to contact me.
class ContactMeHomePageSection extends StatelessWidget {
  /// Creates the section that contains methods to contact me.
  const ContactMeHomePageSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      title: 'Contact Me',
      icon: Icons.mail_outline_outlined,
      child: SizedBox(
        width: double.infinity,
        child: Column(
          children: const <Widget>[
            Text(
              '''
If you wish to have an online shop, a landing page, a mobile application, and more, do not miss this opportunity, contact me now!''',
            ),
            ContactMeButton(
              isPrimary: false,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
