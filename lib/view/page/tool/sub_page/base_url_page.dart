import 'package:app/export.dart';

class BaseUrlPage extends StatefulWidget {
  static const String route = '/BaseUrlPage';
  const BaseUrlPage({Key? key}) : super(key: key);

  @override
  State<BaseUrlPage> createState() => _BaseUrlPageState();
}

class _BaseUrlPageState extends State<BaseUrlPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: const BackArrowWidget(),
      title: const Text('Base Url'),
    ),
    body: Container(),
    );
  }
}