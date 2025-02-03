import 'package:app/export.dart';

class SocketEvent {
  static String todoGet = 'todo:get';
}

typedef AppSocketState = BaseSocketState;

@Injectable()
class AppSocketCubit extends BaseSocketCubit {
  AppSocketCubit(this.socket) : super(socket);

  final AppSocket socket;

  void get() {
    onEmitWithAck<EmptyResponse>(SocketEvent.todoGet);
  }
}
