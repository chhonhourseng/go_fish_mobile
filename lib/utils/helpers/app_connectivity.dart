import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:app/export.dart';


///AppConnectivity
class AppConnectivity {
  static Connectivity? _connectInstance;

  static Connectivity get instance {
    _connectInstance ??= Connectivity();
    return _connectInstance!;
  }

  ///
  static Future<bool> init() async {
    _connectInstance = instance;
    if (!kDebugMode) {
      _connectInstance!.onConnectivityChanged.listen(_onConnectionChanged);
    }
    return true;
  }

  static ConnectivityResult? _previousConnectivityResult;

  static void _onConnectionChanged(connectionResult) {
    if (connectionResult != ConnectivityResult.none) {
      appEventBus.fire(const AppEventBusConnectivity(isConnected: true));
      _previousConnectivityResult = connectionResult;
    } else if (_previousConnectivityResult == null ||
        _previousConnectivityResult != ConnectivityResult.none) {
      appEventBus.fire(const AppEventBusConnectivity(isConnected: false));
      _previousConnectivityResult = connectionResult;
    }
  }

  static Future<void> onResume() async {
    if (!kDebugMode) {
      final connectivityResult = await _connectInstance!.checkConnectivity();
      _onConnectionChanged(connectivityResult);
    }
  }
}

class AppEventBusConnectivity {
  final bool isConnected;

  const AppEventBusConnectivity({this.isConnected = true});
}
