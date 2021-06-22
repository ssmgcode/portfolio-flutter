import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/application_theme/application_theme_cubit.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/locator.dart';
import 'package:portfolio/router/router.dart';
import 'package:portfolio/shared_preferences/user_preferences.dart';
import 'package:portfolio/ui/layouts/main_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().initPreferences();
  setupLocator();
  Flurorouter.configureRoutes();
  runApp(const ApplicationStateProvider());
}

/// Builds [MyApp] and depending on [ApplicationThemeModeCubit].
class ApplicationStateProvider extends StatelessWidget {
  /// Builds [MyApp] and depending on [ApplicationThemeModeCubit].
  const ApplicationStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationThemeModeCubit>(
          create: (_) => ApplicationThemeModeCubit(),
        ),
      ],
      child: const MyApp(),
    );
  }
}

/// Main application enter point for UI.
class MyApp extends StatelessWidget {
  /// Constant constructor for main application enter point for UI.
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApplicationThemeModeCubit, ThemeMode>(
      builder: (_, ThemeMode themeMode) => MaterialApp(
        title: 'SSMG Code',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        home: const MainLayout(),
      ),
    );
  }
}
