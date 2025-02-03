import 'package:event_bus/event_bus.dart';
import 'package:app/export.dart';

final EventBus appEventBus = EventBus();

final GlobalKey<NavigatorState> globalKey = GlobalKey<NavigatorState>();

const LANGUAGE = 'LANGUAGE';

const CONFIG_BASE_URL = 'CONFIG_BASE_URL';

class AppHttpError {
  AppHttpStatus status;
  String? message;

  AppHttpError({required this.status, required this.message});

  @override
  String toString() {
    return message ?? T.somethingUnexpectedWentWrong.r;
  }
}