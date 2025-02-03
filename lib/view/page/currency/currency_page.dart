import 'package:app/export.dart';

class CurrencyPage extends StatefulWidget {
  static const String route = '/CurrencyPage';
  const CurrencyPage({Key? key}) : super(key: key);

  @override
  State<CurrencyPage> createState() => _CurrencyPageState();
}

class _CurrencyPageState extends State<CurrencyPage>  with BaseBlocBuilder<CurrencyResponse>{

  late final CurrencyCubit cubit;

  @override
  void initState() {
    cubit = context.read<CurrencyCubit>();
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  Future<void> onLoadedWidget(BuildContext context) async {
    request();
  }

  @override
  void request() {
    request();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
      leading: const BackArrowWidget(),
      title: Text(T.currency.r),
    ),
    body: BlocBuilder<CurrencyCubit, CurrencyState>(
      builder: (context, state) {
        return Container();
        },
      ),
    );
  }
}