// import 'package:flutter/material.dart';

// class AppNavigatorObserver extends NavigatorObserver {
//   List<Route<dynamic>> routeStack = [];

//   @override
//   void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     routeStack.add(route);
//   }

//   @override
//   void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
//     routeStack.removeLast();
//   }

//   @override
//   void didRemove(Route route, Route? previousRoute) {
//     routeStack.removeLast();
//   }

//   @override
//   void didReplace({Route? newRoute, Route? oldRoute}) {
//     routeStack.removeLast();
//     if (newRoute != null) {
//       routeStack.add(newRoute);
//     }
//   }
// }
