import 'package:app/export.dart';

class LanguageWidget extends StatefulWidget {
  const LanguageWidget({super.key});

  @override
  State<LanguageWidget> createState() => _LanguageWidgetState();
}

class _LanguageWidgetState extends State<LanguageWidget> with BaseListBlocBuilder<LanguageResponse> {
  late final GetLanguageCubit cubit;

  @override
  void initState() {
    cubit = context.read<GetLanguageCubit>();
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
    return BlocBuilder<GetLanguageCubit, GetLanguageState>(
      builder: (context, state) {
        return Container(
          child: buildWidget(context, cubit, state, builder: (c, data) {
            return Column(
              children: List.from(data.map((e) => listItemWidget(0, e))),
            );
          }),
        );
        return buildList(context, cubit, state, padding: app.screenPadding, separator: (i) => 0.s());
      },
    );
  }

  @override
  Widget listItemWidget(int index, LanguageResponse data) {
    return BottomSheetItemWidget(
      data: AppBottomSheetActionModel(
        text: data.name,
        image: Opacity(
          opacity: app.currentLocale.languageCode == data.code ? 1 : 0,
          child: const Icon(Icons.check),
        ),
        //callbackAction: () => context.read<LanguageCubit>().change(e),
      ),
    );
  }
}
