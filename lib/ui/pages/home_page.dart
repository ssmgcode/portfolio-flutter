import 'package:flutter/material.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/ui/widgets/app_bar.dart';
import 'package:portfolio/ui/widgets/contact_me_button/contact_me_button.dart';
import 'package:portfolio/ui/widgets/favorite_technologies_presentation.dart';
import 'package:portfolio/ui/widgets/footer/footer.dart';
import 'package:portfolio/ui/widgets/home_page_sections/about_me_section.dart';
import 'package:portfolio/ui/widgets/home_page_sections/contact_me_section.dart';
import 'package:portfolio/ui/widgets/home_page_sections/languages_section.dart';
import 'package:portfolio/ui/widgets/home_page_sections/projects_section.dart';
import 'package:portfolio/ui/widgets/home_page_sections/skills_section.dart';
import 'package:portfolio/ui/widgets/ssmg_poster.dart';

/// Displays the root view of the portfolio.
class HomePage extends StatelessWidget {
  /// Displays the root view of the portfolio.
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: <Widget>[
            Container(
              height: 80,
              color: AppTheme.brandColor,
            ),
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
                    ContactMeButton(
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AboutMeHomePageSection(),
                    FittedBox(
                      child: FavoriteTechnoloiesPresentation(),
                    ),
                    LanguagesHomePageSection(),
                    SizedBox(
                      height: 25,
                    ),
                    SkillsHomePageSection(),
                    SizedBox(
                      height: 25,
                    ),
                    ProjectsHomePageSection(),
                    SizedBox(
                      height: 25,
                    ),
                    ContactMeHomePageSection(),
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
