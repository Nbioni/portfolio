import 'package:flutter_modular/flutter_modular.dart';

/// Class used to standardize the navigation between application routes.
///
/// If you want to keep the previous routes, use [AppNavigation.navigateTo],
/// and if you want to change the route and remove the previous route use [AppNavigation.destroyPreviousAndNavigateTo].
class AppNavigation {
  /// Navigates to a [route].
  AppNavigation.navigateTo(String route, {dynamic args}) {
    Modular.to.pushNamed(route, arguments: args);
  }

  /// Back to previous navigation.
  AppNavigation.pop() {
    Modular.to.pop();
  }

  /// Navigates to a [route] removing the previous route.
  AppNavigation.destroyPreviousAndNavigateTo(String route, {dynamic args}) {
    Modular.to.navigate(route, arguments: args);
  }
}

/// #### Routes Configuration Class
/// It doesn't implement the routes, it just unifies the constants with the available routes in the system.
class AppRoutes {
  static String home = '/';
  static String login = '/login/';
  static String highlightAddress = '/highlight-address/';
  static String propertyProfile = '/property-profile/';
}
