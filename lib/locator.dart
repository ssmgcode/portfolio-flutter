import 'package:get_it/get_it.dart';
import 'package:portfolio/services/navigation_service.dart';

/// An instance of a singleton of GetIt
GetIt locator = GetIt.instance;

/// Used to setup and register the locator in a lazy way.
void setupLocator() {
  locator.registerLazySingleton(() => NavigationService());
}
