import 'package:app/export.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  static const String route = '/';

  static GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late final String id;

  @override
  void initState() {
    id = app.uuid;
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(T.home.r),
      ),
      body: AppListViewBuilder(padding: app.screenPadding, children: [
      ].separator((i) => 10.sh())),
    );
  }
}
