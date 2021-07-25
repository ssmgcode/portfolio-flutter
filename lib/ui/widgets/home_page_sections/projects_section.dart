import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/router/page_manager.dart';
import 'package:portfolio/ui/widgets/custom_card.dart';
import 'package:portfolio/utils/open_url_with_copy_to_clipboard_fallback.dart'
    as utils;

/// Creates the section that contains information about projects I have done.
class ProjectsHomePageSection extends StatelessWidget {
  /// Creates the section that contains information about projects I have done.
  const ProjectsHomePageSection({Key? key}) : super(key: key);

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
            const Text(
              'See all my done projects and find inspiration for yours.',
            ),
            const SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () =>
                    RouterPageManager.of(context).openProjectsPage(),
                child: const Text('Explore my projects'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
