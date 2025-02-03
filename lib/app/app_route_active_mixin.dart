import 'package:app/export.dart';

mixin AppRouteActiveMixin<T extends StatefulWidget> on State<T> implements RouteAware {
  bool _subscribed = false;
  bool isActive = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!_subscribed) {
      App.routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
      _subscribed = true;
    }
  }

  @override
  void dispose() {
    if (_subscribed) {
      App.routeObserver.unsubscribe(this);
      _subscribed = false;
    }
    super.dispose();
  }

  @override
  void didPush() => onActive();

  @override
  void didPopNext() => onActive();

  @override
  void didPop() => onInactive();

  @override
  void didPushNext() => onInactive();

  /// Update active flag
  void onActive() {
    isActive = true;
  }

  /// Update inactive flag
  void onInactive() {
    isActive = false;
  }
}
