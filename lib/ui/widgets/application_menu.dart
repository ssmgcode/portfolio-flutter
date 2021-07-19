import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:portfolio/bloc/application_theme/application_theme_cubit.dart';
import 'package:portfolio/config/personal_information.dart';
import 'package:portfolio/router/page_manager.dart';

/// A custom bottom sheet for mobile application menu.
class ApplicationMenu extends StatelessWidget {
  /// A custom bottom sheet for mobile application menu.
  const ApplicationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 19.0,
              vertical: 15,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Application Menu',
                  style: Theme.of(context).textTheme.headline5!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const Padding(
                  padding: EdgeInsets.only(
                    left: 15.0,
                  ),
                  child: CloseButton(),
                ),
              ],
            ),
          ),
          const _SetThemeExpansionPanel(),
          ListTile(
            title: const Text('Projects'),
            leading: const Icon(Icons.task_alt_rounded),
            onTap: () {
              Navigator.pop(context);
              RouterPageManager.of(context).openProjectsPage();
            },
          ),
          ListTile(
            title: const Text('Contact Me'),
            leading: const Icon(Icons.phone_outlined),
            onTap: () {
              Navigator.pop(context);
              RouterPageManager.of(context).openContactMePage();
            },
          ),
          ListTile(
            title: const Text('More info'),
            leading: const Icon(Icons.info_outline_rounded),
            onTap: () => showAboutDialog(
              context: context,
              applicationVersion: '0.5.0',
              applicationName: 'SSMG Code portfolio',
              applicationIcon: Image.asset(
                'assets/ssmg-logo.png',
                width: 64,
              ),
              children: <Widget>[
                ListTile(
                  title: const Text('View on Github'),
                  leading: const Icon(Icons.link_outlined),
                  onTap: () async {
                    if (await canLaunch(
                        PersonalInformation.projectRepositoryUrl)) {
                      await launch(PersonalInformation.projectRepositoryUrl);
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _SetThemeExpansionPanel extends StatefulWidget {
  const _SetThemeExpansionPanel({Key? key}) : super(key: key);

  @override
  __SetThemeExpansionPanelState createState() =>
      __SetThemeExpansionPanelState();
}

class __SetThemeExpansionPanelState extends State<_SetThemeExpansionPanel> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return ExpansionPanelList(
      elevation: 0,
      expansionCallback: (_, __) => setState(() => _isExpanded = !_isExpanded),
      expandedHeaderPadding: EdgeInsets.zero,
      children: <ExpansionPanel>[
        ExpansionPanel(
          headerBuilder: (_, isExpanded) => const ListTile(
            title: Text('Set theme'),
            leading: Icon(Icons.dark_mode_outlined),
          ),
          body: const _ThemeRadioListTiles(),
          canTapOnHeader: true,
          isExpanded: _isExpanded,
        ),
      ],
    );
  }
}

class _ThemeRadioListTiles extends StatelessWidget {
  const _ThemeRadioListTiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<ApplicationThemeModeCubit>(context);
    return BlocBuilder<ApplicationThemeModeCubit, ThemeMode>(
      builder: (BuildContext context, ThemeMode state) {
        return Column(
          children: <Widget>[
            RadioListTile<ThemeMode>(
              title: const Text('System'),
              value: ThemeMode.system,
              groupValue: state,
              onChanged: (ThemeMode? themeMode) =>
                  blocProvider.setThemeMode(themeMode!),
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Light'),
              value: ThemeMode.light,
              groupValue: state,
              onChanged: (ThemeMode? themeMode) =>
                  blocProvider.setThemeMode(themeMode!),
            ),
            RadioListTile<ThemeMode>(
              title: const Text('Dark'),
              value: ThemeMode.dark,
              groupValue: state,
              onChanged: (ThemeMode? themeMode) =>
                  blocProvider.setThemeMode(themeMode!),
            ),
          ],
        );
      },
    );
  }
}
