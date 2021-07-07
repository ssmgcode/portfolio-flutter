import 'package:flutter/material.dart';
import 'package:flutter_boxicons/flutter_boxicons.dart';
import 'package:portfolio/models/project_model.dart';
import 'package:portfolio/utils/open_url_with_copy_to_clipboard_fallback.dart'
    as utils;

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
                onPressed: () async =>
                    await utils.openUrlWithCopyToClipboardFallback(
                  project.repositoryUrl!,
                ),
                style: ElevatedButton.styleFrom(
                  primary: DefaultTextStyle.of(context).style.color,
                  onPrimary: Theme.of(context).primaryColor,
                ),
                icon: const Icon(Boxicons.bxl_github),
                label: const Text('Visit on Github'),
              ),
            ),
          ),
        Row(
          children: <Widget>[
            if (project.webUrl != null)
              _SecondaryButton(
                icon: const Icon(Icons.language_outlined),
                label: 'Web',
                url: project.webUrl!,
              ),
            if (project.webUrl != null && project.googlePlayStoreUrl != null ||
                project.appleAppStoreUrl != null)
              const SizedBox(
                width: 5,
              ),
            if (project.googlePlayStoreUrl != null)
              _SecondaryButton(
                icon: const Icon(Boxicons.bxl_play_store),
                label: 'Get',
                url: project.googlePlayStoreUrl!,
              ),
            if (project.googlePlayStoreUrl != null && project.webUrl != null ||
                project.appleAppStoreUrl != null)
              const SizedBox(
                width: 5,
              ),
            if (project.appleAppStoreUrl != null)
              _SecondaryButton(
                icon: const Icon(Boxicons.bxl_apple),
                label: 'Get',
                url: project.appleAppStoreUrl!,
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
    required this.url,
  }) : super(key: key);

  final Widget icon;
  final String label;
  final String url;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () async => await utils.openUrlWithCopyToClipboardFallback(
          url,
        ),
        style: OutlinedButton.styleFrom(
          primary: DefaultTextStyle.of(context).style.color,
        ),
        icon: icon,
        label: Text(label),
      ),
    );
  }
}
