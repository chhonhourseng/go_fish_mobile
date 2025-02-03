import 'package:app/export.dart';

//typedef  = ;
class TextFieldByLangData {
  final TextEditingController textController;
  final int? id;

  const TextFieldByLangData({
    required this.textController,
    this.id,
  });
}

class TextFieldByLang {
  final Map<AppLocales, TextFieldByLangData> value;

  const TextFieldByLang(this.value);

  factory TextFieldByLang.fromJson(List json) {
    final Map<AppLocales, TextFieldByLangData> data = {};
    for (var v in json) {
      data[AppLocales.matchLanguageCode(v['language_code'])] = TextFieldByLangData(
        textController: TextEditingController(text: v['translate'].toString().toAppString()!),
        id: v['id'].toString().toAppInt(),
      );
    }
    return TextFieldByLang(data);
  }

  List<Map<String, dynamic>> toJson() {
    return List.from(this.value.entries.map((e) => {
          if (e.value.id != null) 'id': e.value.id,
          'language_code': e.key.languageCode,
          'translate': e.value.textController.text,
        }));
  }
}

class TextFieldByLanguageWidget extends StatefulWidget {
  const TextFieldByLanguageWidget({
    super.key,
    this.hintText,
    this.onChanged,
    this.data,
    this.init,
    this.validator,
    this.maxLines,
    this.minLines,
  });

  final String? hintText;
  final TextFieldByLang? data;
  final ValueChanged<TextFieldByLang>? init;
  final ValueChanged<TextFieldByLang>? onChanged;
  final FormFieldValidator<String>? validator;
  final int? maxLines;
  final int? minLines;

  @override
  State<TextFieldByLanguageWidget> createState() => _TextFieldByLanguageWidgetState();
}

class _TextFieldByLanguageWidgetState extends State<TextFieldByLanguageWidget> {
  TextFieldByLanguageWidget get i => widget;

  List<AppLocales> get language => AppLocales.values.where((e) => !(i.data?.value.containsKey(e) ?? false)).toList();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) => onLoadedWidget(context));
    super.initState();
  }

  final AppLocales defaultLang = app.DEFAULT_LOCALE;

  Future<void> onLoadedWidget(BuildContext context) async {
    i.init?.call(TextFieldByLang({defaultLang: TextFieldByLangData(textController: TextEditingController())}));
  }

  @override
  Widget build(BuildContext context) {
    return (i.data?.value.isNotEmpty ?? false)
        ? Column(
            children: List.from(i.data!.value.entries.map((e) => item(context, locale: e.key, controller: e.value.textController)))
                .separator((i) => 10.sh()),
          )
        : Text(T.errorMissingInit.r, style: context.textTheme.labelMedium);
  }

  Widget languageIcon(BuildContext context, AppLocales locale) {
    return Container(
      padding: 3.p(),
      width: 40,
      margin: 5.pt(),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.blue),
        borderRadius: 5.r(),
      ),
      child: Center(child: Text(locale.sub.toUpperCase(), style: context.textTheme.labelMedium)),
    );
  }

  Widget item(
    BuildContext context, {
    required AppLocales locale,
    required TextEditingController controller,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        languageIcon(context, locale),
        8.sw(),
        Expanded(
          child: TextFieldWidget(
            label: i.hintText,
            controller: controller,
            validator: i.validator,
            maxLines: i.maxLines,
            minLines: i.minLines,
          ),
        ),
        if (defaultLang.locale == locale.locale) ...[
          AppGestureDetector(
            padding: 5.p(),
            onTap: () => addLanguage(context),
            child: Icon(Icons.add, color: language.isEmpty ? AppColor.greyLightII : null),
          ),
        ] else ...[
          AppGestureDetector(
            padding: 5.p(),
            onTap: () {
              Map<AppLocales, TextFieldByLangData> data = i.data!.value;
              data.remove(locale);
              i.onChanged?.call(TextFieldByLang(data));
            },
            child: Container(
              padding: 5.p(),
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(0.3),
                borderRadius: 1000.r(),
              ),
              child: const Icon(
                Icons.close,
                color: Colors.red,
                size: 13,
              ),
            ),
          ),
        ],
      ],
    );
  }

  void addLanguage(BuildContext context) {
    AppBottomSheet.showAction(
      context,
      title: T.addLanguage.r,
      children: List.from(language.map(
        (e) => AppBottomSheetActionModel(
          text: e.name,
          image: languageIcon(context, e),
          callbackAction: () {
            if (widget.data?.value.isNotEmpty ?? false) {
              widget.onChanged?.call(TextFieldByLang({
                ...i.data!.value,
                ...{e: TextFieldByLangData(textController: TextEditingController())}
              }));
            } else {
              widget.onChanged?.call(TextFieldByLang({e: TextFieldByLangData(textController: TextEditingController())}));
            }
          },
        ),
      )),
    );
  }
}
