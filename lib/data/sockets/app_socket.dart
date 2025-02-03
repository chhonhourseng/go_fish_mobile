import 'package:app/export.dart';

@Injectable()
class AppSocket extends SocketInterface {
  @override
  String get getUrl => 'http://192.168.0.4:3000/event';
}
