import 'package:bloc/bloc.dart';
import 'package:portfolio/router/router.dart';

/// Manage the route state of the application.
class RouteCubit extends Cubit<String> {
  /// Manage the route state of the application.
  RouteCubit() : super(Flurorouter.rootRoute);

  /// Sets the route for the application.
  void setCurrentRoute(String routeName) {
    emit(routeName);
  }
}
