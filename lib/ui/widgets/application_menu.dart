import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/application_theme/application_theme_cubit.dart';

/// A custom bottom sheet for mobile application menu.
class ApplicationMenu extends StatelessWidget {
  /// A custom bottom sheet for mobile application menu.
  const ApplicationMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 180.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              left: 20.0,
              top: 15.0,
            ),
            child: Text(
              'Application Menu',
              style: Theme.of(context).textTheme.headline5!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const _SetThemeExpansionPanel(),
          ListTile(
            title: const Text('Projects'),
            leading: const Icon(Icons.task_alt_rounded),
            onTap: () {},
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
