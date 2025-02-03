import 'package:app/export.dart';

class ToolPage extends StatefulWidget {
  static const String route = '/ToolPage';

  const ToolPage({Key? key}) : super(key: key);

  @override
  State<ToolPage> createState() => _ToolPageState();
}

class _ToolPageState extends State<ToolPage> {
  final TextEditingController baseUrl = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void initState() {
    baseUrl.text = app.getConfigBaseUrl;
    super.initState();
  }

  void save() {
    if (formKey.currentState?.validate() ?? false) {
      app.storage.put<String>(key: CONFIG_BASE_URL, data: baseUrl.text);
      app.snackBar.show(T.successFul.r, type: SnackBarType.success);
    }
  }

  void reset() {
    app.storage.delete(key: CONFIG_BASE_URL);
    baseUrl.clear();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackArrowWidget(),
        title: Text(T.tool.r),
        actions: [
          AppGestureDetector(
            padding: 15.p(),
            onTap: () => reset(),
            child: Text('Reset', style: context.textTheme.headlineSmall),
          ),
        ],
      ),
      body: Form(
        key: formKey,
        child: AppListViewBuilder(padding: app.screenPadding, children: [
          TextFieldWidget(
            hintText: 'Custom Base Url',
            controller: baseUrl,
            validator: (v) => app.validation.isNativeUrlRequire(v, 'Custom Base Url'),
            helperText: AppEnv.baseUrl,
          ),
          SizedBox(
            width: context.mediaQuery.size.width,
            child: FilledButton(onPressed: () => save(), child: const Text('Save')),
          ),
        ].separator((i) => 20.sh())),
      ),
    );
  }

  Widget menuWidget({required String title, GestureTapCallback? onTap}) {
    return InkWell(
      onTap: () {
        HomePage.scaffoldKey.currentState?.closeEndDrawer();
        onTap?.call();
      },
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: context.textTheme.bodyMedium),
          ),
          const Icon(
            Icons.arrow_forward_ios_outlined,
            size: 14,
            color: AppColor.greyLightI,
          ),
        ],
      ),
    );
  }
}
