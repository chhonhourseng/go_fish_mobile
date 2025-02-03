import 'dart:async';
import 'package:socket_io_client/socket_io_client.dart';

class SocketUtil {
  static Future<Socket> initConnection({
    required String url,
    String? path,
  }) async {
    final completer = Completer<Socket>();
    OptionBuilder optionBuilder = OptionBuilder().setTransports(['websocket']).disableAutoConnect();
    Socket socket = io(
      url,
      path != null ? optionBuilder.setPath(path).enableForceNew().build() : optionBuilder.enableForceNew().build(),
    );
    try {
      socket.connect();
      completer.complete(socket);
    } catch (e) {
      completer.completeError(socket);
    }
    return completer.future;
  }
}
