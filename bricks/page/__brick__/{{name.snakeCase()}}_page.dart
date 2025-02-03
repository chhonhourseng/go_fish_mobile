import 'package:app/export.dart';

class {{name.pascalCase()}}Page extends StatefulWidget {
  static const String route = '/{{name.pascalCase()}}Page';
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  State<{{name.pascalCase()}}Page> createState() => _{{name.pascalCase()}}PageState();
}

class _{{name.pascalCase()}}PageState extends State<{{name.pascalCase()}}Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: const BackArrowWidget(),
      title: Text(T.{{name.camelCase()}}.r),
    ),
    body: Container(),
    );
  }
}