import 'package:flutter/material.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/ui/utils/boxicons.dart';

/// Contains the action buttons to go to links of the project.
class ProjectCardFooter extends StatelessWidget {
  /// Contains the action buttons to go to links of the project.
  const ProjectCardFooter({
    Key? key,
    required this.project,
  }) : super(key: key);

  /// The project it needs to work.
  final Project project;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (project.repositoryUrl != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  primary: DefaultTextStyle.of(context).style.color,
                  onPrimary: Theme.of(context).primaryColor,
                ),
                icon: Boxicons.bxl_github,
                label: const Text('Visit on Github'),
              ),
            ),
          ),
        Row(
          children: <Widget>[
            if (project.webUrl != null)
              const _SecondaryButton(
                icon: Icon(Icons.language_outlined),
                label: 'Web',
              ),
            if (project.webUrl != null && project.googlePlayStoreUrl != null ||
                project.appleAppStoreUrl != null)
              const SizedBox(
                width: 5,
              ),
            if (project.googlePlayStoreUrl != null)
              const _SecondaryButton(
                icon: Boxicons.bxl_play_store,
                label: 'Get',
              ),
            if (project.googlePlayStoreUrl != null && project.webUrl != null ||
                project.appleAppStoreUrl != null)
              const SizedBox(
                width: 5,
              ),
            if (project.appleAppStoreUrl != null)
              const _SecondaryButton(
                icon: Boxicons.bxl_apple,
                label: 'Get',
              ),
          ],
        ),
      ],
    );
  }
}

class _SecondaryButton extends StatelessWidget {
  const _SecondaryButton({
    Key? key,
    required this.icon,
    required this.label,
  }) : super(key: key);

  final Widget icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        style: OutlinedButton.styleFrom(
          primary: DefaultTextStyle.of(context).style.color,
        ),
        icon: icon,
        label: Text(label),
      ),
    );
  }
}
