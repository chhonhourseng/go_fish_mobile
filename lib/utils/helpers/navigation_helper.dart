import 'dart:developer';

import 'package:app/export.dart';

/// Context-less Navigation
///
/// This class is using a global navigator key
///
/// If global navigator key is not supplied to the main MaterialApp, it will fail
///

class NavigationHelper {
  final BuildContext? context;

  NavigationHelper([this.context]);

  static final BuildContext _context = app.context;

  BuildContext get getContext => context ?? _context;

  T? getArg<T>() {
    try {
      return ModalRoute.of(getContext)!.settings.arguments as T;
    } catch (_) {
      return null;
    }
  }

  Future<T?> push<T>(Widget widget, {T? arguments, String? routeName}) async {
    log('Push to Route $routeName', name: 'NavigationHelper');
    return await Navigator.push<T>(
      getContext,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(arguments: arguments, name: routeName),
      ),
    );
  }

  Future<T?> pushReplacement<T, TO>(Widget widget, {T? arguments, String? routeName, TO? result}) async {
    log('Push Replace $routeName', name: 'NavigationHelper');
    return await Navigator.pushReplacement<T, TO>(
      getContext,
      MaterialPageRoute(
        builder: (context) => widget,
        settings: RouteSettings(arguments: arguments, name: routeName),
      ),
      result: result,
    );
  }

  Future<T?> pushNamed<T>(String routeName, [arg]) async {
    log('Push to Route $routeName', name: 'NavigationHelper');
    return await Navigator.pushNamed<T>(
      getContext,
      routeName,
      arguments: arg,
    );
  }

  Future<T?> pushReplacementNamed<T>(String route, [arg]) {
    log('Push Replacing current route with $route ::::::::::', name: 'NavigationHelper');
    return Navigator.pushReplacementNamed(getContext, route, arguments: arg);
  }

  Future pushNamedAndRemoveUntil(String route, {dynamic arg, String? predicate}) {
    log('pushAndRemoveUntil to $route ::::::::::', name: 'NavigationHelper');
    return Navigator.pushNamedAndRemoveUntil(
      getContext,
      route,
      (Route<dynamic> route) {
        if (predicate == null) return false;
        return route.settings.name == predicate;
      },
      arguments: arg,
    );
  }

  Future pushAndRemoveUntil(
    Widget page,
    String? predicate, {
    Object? arguments,
    String? route,
  }) {
    log('pushAndRemoveUntil $route::::::::::', name: 'NavigationHelper');
    return Navigator.pushAndRemoveUntil(
      getContext,
      MaterialPageRoute(
        builder: (BuildContext context) => page,
        settings: RouteSettings(arguments: arguments, name: route),
      ),
      (route) => route.settings.name == predicate,
    );
  }

  Future<bool> pop<T>({T? arg, bool rootNavigator = false}) {
    var prevRoute = ModalRoute.of(getContext)?.settings.name ?? '';
    log('Pop on $prevRoute', name: 'NavigationHelper');
    return Navigator.of(getContext, rootNavigator: rootNavigator).maybePop(arg);
  }

  void popUntil(String route) {
    log('PopUntil ::::::::::', name: 'NavigationHelper');
    Navigator.popUntil(getContext, ModalRoute.withName(route));
  }

  void forcedPop<T>({T? arg, bool rootNavigator = false}) {
    var prevRoute = ModalRoute.of(getContext)?.settings.name ?? '';
    log('Forcing Pop on $prevRoute ::::::::::', name: 'NavigationHelper');
    Navigator.of(getContext, rootNavigator: rootNavigator).pop(arg);
  }
}
