import 'package:app/export.dart';

class {{name.pascalCase()}}Page extends StatefulWidget {
  static const String route = '/{{name.pascalCase()}}Page';
  const {{name.pascalCase()}}Page({Key? key}) : super(key: key);

  @override
  State<{{name.pascalCase()}}Page> createState() => _{{name.pascalCase()}}PageState();
}

class _{{name.pascalCase()}}PageState extends State<{{name.pascalCase()}}Page>  with BaseBlocBuilder<{{name.pascalCase()}}Response>{

  late final {{name.pascalCase()}}Cubit cubit;

  @override
  void initState() {
    cubit = context.read<{{name.pascalCase()}}Cubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  Future<void> onLoadedWidget(BuildContext context) async {
    request();
  }

  @override
  void request() {
    cubit.request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: const BackArrowWidget(),
      title: Text(T.{{name.camelCase()}}.r),
    ),
    body: BlocBuilder<{{name.pascalCase()}}Cubit, {{name.pascalCase()}}State>(
      builder: (context, state) {
        return Container();
        },
      ),
    );
  }
}