import 'dart:developer';

import 'package:app/export.dart';
import 'package:socket_io_client/socket_io_client.dart';

extension SocketExtenstion on Socket {
  void onEmit<K>(String event, {ValueChanged<BaseResponse<K>>? onChange}) {
    log(event, name: 'Socket');
    this.on(event, (v) {
      try {
        onChange?.call(BaseResponse.fromMap(v, (data) {
          return deserialize<K>(data);
        }));
      } catch (e) {
        if (kDebugMode) {}
        throw CustomException(e).toString();
      }
    });
  }

  void onEmitWithAck<K>(String event, {dynamic data, ValueChanged<BaseResponse<K>>? onChange}) {
    log(event, name: 'Socket');
    this.emitWithAck(event, data, ack: (v) {
      if (kDebugMode) {}
      try {
        onChange?.call(BaseResponse.fromMap(v, (data) {
          return deserialize<K>(data);
        }));
      } catch (e) {
        if (kDebugMode) {}
        throw CustomException(e).toString();
      }
    });
  }
}
