import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:portfolio/bloc/application_theme/application_theme_cubit.dart';
import 'package:portfolio/bloc/contact_me_form_bloc/contact_me_form_bloc.dart';
import 'package:portfolio/config/app_theme.dart';
import 'package:portfolio/router/my_app_route_information_parser.dart';
import 'package:portfolio/router/my_app_router_delegate.dart';
import 'package:portfolio/services/snackbar_service.dart';
import 'package:portfolio/shared_preferences/user_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserPreferences().initPreferences();
  runApp(const MyAppStateProvider());
}

/// Builds [MyApp] and depending on [ApplicationThemeModeCubit].
class MyAppStateProvider extends StatelessWidget {
  /// Builds [MyApp] and depending on [ApplicationThemeModeCubit].
  const MyAppStateProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ApplicationThemeModeCubit>(
          create: (_) => ApplicationThemeModeCubit(),
        ),
        BlocProvider<ContactMeFormBloc>(
          create: (_) => ContactMeFormBloc(),
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
      builder: (_, ThemeMode themeMode) => MaterialApp.router(
        title: 'SSMG Code',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: themeMode,
        routeInformationParser: MyAppRouteInformationParser(),
        routerDelegate: MyAppRouterDelegate(),
        scaffoldMessengerKey: SnackBarService.messengerKey,
      ),
    );
  }
}
