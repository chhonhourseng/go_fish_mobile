import 'dart:async';
import 'package:app/export.dart';
import 'package:socket_io_client/socket_io_client.dart';

abstract class SocketInterface {
  Socket? instant;
  Function(bool isConnected)? _listener;

  String get getUrl;

  String? get getPath => null;

  FutureOr<void> initSocketConnection({required Function(dynamic) onError, required ValueChanged<dynamic> onSuccess}) async {
    instant = await SocketUtil.initConnection(
      url: getUrl,
      path: getPath,
    );
    instant?.onError((data) {
      if (kDebugMode) {}
      onError.call(data);
      _notifyListener(false);
    });
    instant?.onConnect((data) {
      if (kDebugMode) {}
      onSuccess.call(data.toString());
      _notifyListener(true);
    });
  }

  bool get isConnected => instant?.connected ?? false;

  void addListener(Function(bool isConnected) listener) {
    _listener = listener;
  }

  void removeListener() {
    _listener = null;
  }

  void _notifyListener(bool isConnected) {
    if (_listener != null) {
      try {
        _listener?.call(isConnected);
      } catch (_) {}
    }
  }

  void close() {
    if (instant?.connected == true) {
      instant?.clearListeners();
      instant?.dispose();
    }
  }
}
