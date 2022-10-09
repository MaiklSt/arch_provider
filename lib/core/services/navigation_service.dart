import 'package:flutter/material.dart';

class NavigationService {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();
  // final Preferences _preferences = locator<Preferences>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return _navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  // Future<dynamic> navigateWithReplacementTo(String routeName, {Object? arguments}) {
  //   return _navigatorKey.currentState!.pushReplacementNamed(routeName, arguments: arguments);
  // }

  // Future<dynamic> navigateAndRemoveStack(String route, {Object? arguments}) {
  //   return _navigatorKey.currentState!.pushNamedAndRemoveUntil(route, (Route<dynamic> route) => false, arguments: arguments);
  // }

  // void setValuesAndNavigate({LoginMethod? method, bool? didLogout, dynamic route, args}) {
  //   if (method != null) _preferences.setLoginMethod(method);
  //   _preferences.setLoggedOut(didLogout!);
  //   navigateAndRemoveStack(route, arguments: args);
  // }

  // void goBack({List? res}) {
  //   return navigatorKey.currentState!.pop(res);
  // }
}
