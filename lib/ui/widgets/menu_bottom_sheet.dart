import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/application_theme/application_theme_cubit.dart';

/// A custom bottom sheet for mobile application menu.
class MenuBottomSheet extends StatelessWidget {
  /// A custom bottom sheet for mobile application menu.
  const MenuBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final blocProvider = BlocProvider.of<ApplicationThemeModeCubit>(context);
    return SizedBox(
      height: 200.0,
      child: Column(
        children: <Widget>[
          OutlinedButton(
            onPressed: () => blocProvider.setThemeMode(ThemeMode.system),
            child: const Text('System'),
          ),
          OutlinedButton(
            onPressed: () => blocProvider.setThemeMode(ThemeMode.light),
            child: const Text('Light'),
          ),
          OutlinedButton(
            onPressed: () => blocProvider.setThemeMode(ThemeMode.dark),
            child: const Text('Dark'),
          ),
        ],
      ),
    );
  }
}
