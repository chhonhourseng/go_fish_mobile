import 'package:app/export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wechat_assets_picker/wechat_assets_picker.dart';

class AppBottomSheet {
  final TextStyle? buttonTextStyle;
  final bool isScrollable;
  final String buttonText;
  final String? title;
  final double? height;
  final bool isAutoHeight;
  final bool isSafeAreaBottom;
  final Widget child;
  final Widget? headWidget;
  final Widget? bodyHead;
  final Widget? bottomWidget;
  final ButtonStyle? buttonStyle;
  final Color? backgroundColor;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final bool isOK;
  final bool isClose;
  final bool isBorderRadiusStyle;
  final bool isShowDiverHead;
  final bool isTitleCenter;
  final GestureTapCallback? onOK;
  final GestureTapCallback? onClose;
  final bool isNoBarrierColor;
  final bool isCheckKeyboard;
  final List<Cubit>? blocProviderValue;

  const AppBottomSheet({
    required this.child,
    this.headWidget,
    this.bodyHead,
    this.bottomWidget,
    this.isSafeAreaBottom = true,
    this.buttonTextStyle,
    this.title,
    this.height,
    this.isScrollable = false,
    this.isTitleCenter = false,
    this.buttonText = "Show BottomSheet",
    this.buttonStyle,
    this.backgroundColor,
    this.isAutoHeight = false,
    this.padding,
    this.margin,
    this.onOK,
    this.onClose,
    this.isOK = false,
    this.isClose = true,
    this.isBorderRadiusStyle = true,
    this.isShowDiverHead = false,
    this.isNoBarrierColor = false,
    this.isCheckKeyboard = false,
    this.blocProviderValue,
  });

  Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      backgroundColor: Colors.transparent,
      barrierColor: isNoBarrierColor ? Colors.white.withOpacity(.0) : null,
      context: context,
      isScrollControlled: true,
      // height != null ? true : false,
      builder: (context) {
        if (blocProviderValue?.isNotEmpty ?? false) {
          return MultiBlocProvider(
            providers: List.from(blocProviderValue!.map(
              (e) => BlocProvider.value(
                value: e,
              ),
            )),
            child: $ShowModalBuilder(i: this),
          );
        }
        return $ShowModalBuilder(i: this);
      },
    );
  }

  static Future<void> showAction(
    BuildContext context, {
    List<AppBottomSheetActionModel>? children,
    BoxDecoration? itemBoxDecoration,
    String? title,
    double? height,
    Widget? headWidget,
    Widget? bodyHead,
    Widget? bottomWidget,
    bool isScrollable = false,
    bool isTitleCenter = false,
    bool isAutoHeight = true,
    bool isShowDiverHead = false,
    bool isShowBottomBorder = false,
    Widget? child,
    Widget Function(int index)? separatorBuilder,
    List<Cubit>? blocProviderValue,
  }) {
    Widget build = Container(
      margin: const EdgeInsets.only(top: 10, left: 20, right: 20, bottom: 0),
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom / 3),
      child: child ??
          (children == null
              ? const SizedBox.shrink()
              : Column(
                  children: [
                    ...List.generate(children.length, (index) {
                      AppBottomSheetActionModel row = children[index];
                      bool _isShowBottomBorder = isShowBottomBorder ? ((children.length - 1) == index ? false : true) : false;
                      return BottomSheetItemWidget(
                        data: row,
                        isShowBottomBorder: _isShowBottomBorder,
                      );
                    }).separator((index) => separatorBuilder?.call(index) ?? const SizedBox.shrink()),
                    const SafeArea(
                      top: false,
                      child: SizedBox(
                        height: 6,
                      ),
                    ),
                  ],
                )),
    );
    return AppBottomSheet(
      child: build,
      title: title,
      isAutoHeight: isAutoHeight,
      isClose: false,
      isScrollable: isScrollable,
      bodyHead: bodyHead,
      headWidget: headWidget,
      isSafeAreaBottom: false,
      height: height,
      isTitleCenter: isTitleCenter,
      isShowDiverHead: isShowDiverHead,
      bottomWidget: bottomWidget,
      blocProviderValue: blocProviderValue,
    ).show(context);
  }

  static Future<void> showLanguage(
    BuildContext context,
  ) {
    return AppBottomSheet.showAction(
      context,
      title: T.language.r,
      blocProviderValue: [
        BlocProvider.of<LanguageCubit>(context),
      ],
      children: List.from(AppLocales.values.map(
        (e) {
          return AppBottomSheetActionModel(
            text: e.name,
            image: Opacity(
              opacity: app.currentLocale == e.locale ? 1 : 0,
              child: const Icon(Icons.check),
            ),
            callbackAction: () => context.read<LanguageCubit>().change(e),
          );
        },
      )),
    );
  }

  static Future<void> showConfirm(
    BuildContext context, {
    GestureTapCallback? onYes,
    GestureTapCallback? onNo,
    String? customYesText,
    String? customNoText,
    Color? customYesBackgroundColor,
    required String title,
    Widget? body,
    String? subTitle,
  }) {
    return AppBottomSheet(
      isAutoHeight: true,
      isClose: false,
      child: Container(
        margin: EdgeInsets.only(bottom: ContextHelper.bottom),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: app.screenPaddingX,
              child: Column(
                children: [
                  Text(subTitle ?? T.areYouSure.r, style: context.textTheme.labelMedium),
                  5.sh(),
                  Text(title, style: context.textTheme.headlineMedium),
                ],
              ),
            ),
            if (body != null) body,
            1.sh(),
            Container(
              margin: app.screenPaddingX,
              child: Row(
                children: [
                  Expanded(
                    child: OutlinedButton(onPressed: () => context.navigate.pop().then((_) => onNo?.call()), child: Text(customNoText ?? T.no.r)),
                  ),
                  10.sw(),
                  Expanded(
                    child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: customYesBackgroundColor,
                        ),
                        onPressed: () => context.navigate.pop().then((_) => onYes?.call()),
                        child: Text(customYesText ?? T.yes.r)),
                  ),
                ],
              ),
            ),
          ].separator((i) => 10.sh()),
        ),
      ),
    ).show(context);
  }

  static Future<void> showActionChooseImage(
    BuildContext context, {
    ValueChanged<File>? onChanged,
    ValueChanged<List<File>>? onMultipleChanged,
    ValueChanged<List<AssetEntity>>? onSelectedAssets,
    int? maxAssets,
    List<AssetEntity>? selectedAssets,
  }) {
    return AppBottomSheet.showAction(
      context,
      children: [
        AppBottomSheetActionModel(
          text: T.gallery.r,
          callbackAction: () {
            AppPermissionHelper.check(context).then((v) async {
              if (v == true) {
                List<AssetEntity>? assets = await AssetPicker.pickAssets(
                  context,
                  pickerConfig: AssetPickerConfig(
                    requestType: RequestType.image,
                    maxAssets: maxAssets ?? 1,
                    selectedAssets: selectedAssets,
                  ),
                );
                if (assets?.isNotEmpty ?? false) {
                  onSelectedAssets?.call(assets!);
                  final file = await assets!.first.file;
                  if (file != null) {
                    onChanged?.call(file);
                  }

                  /// Multiple
                  if (onMultipleChanged != null) {
                    List<File> files = [];
                    for (var v in assets) {
                      final file = await v.file;
                      if (file != null) {
                        files.add(file);
                      }
                    }
                    onMultipleChanged.call(files);
                  }
                }
              }
            });
          },
        ),
        AppBottomSheetActionModel(
          text: T.camera.r,
          callbackAction: () {
            AppPermissionHelper.check(context).then((v) async {
              if (v == true) {
                final ImagePicker picker = ImagePicker();
                picker.pickImage(source: ImageSource.camera).then((e) async {
                  if (e != null) {
                    final file = await app.xFileToFile(e);
                    onChanged?.call(file);
                    onMultipleChanged?.call([file]);
                  }
                });
              }
            });
          },
        ),
      ],
    );
  }
}

class AppBottomSheetActionModel {
  final String? text;
  final bool textBold;
  final IconData? icon;
  final Color? iconColor;
  final Widget? image;
  final String? imagePath;
  final Color? color;
  final Widget? rightWidget;
  final String? rightText;
  final VoidCallback? callbackAction;

  const AppBottomSheetActionModel({
    this.text,
    this.textBold = false,
    this.icon,
    this.image,
    this.imagePath,
    this.rightWidget,
    this.rightText,
    this.callbackAction,
    this.color,
    this.iconColor,
  });
}

class $ShowModalBuilder extends StatefulWidget {
  final AppBottomSheet i;

  const $ShowModalBuilder({
    super.key,
    required this.i,
  });

  @override
  State<$ShowModalBuilder> createState() => _$ShowModalBuilderState();
}

class _$ShowModalBuilderState extends State<$ShowModalBuilder> with WidgetsBindingObserver {
  AppBottomSheet get i => widget.i;
  bool isKeyboardVisible = false;
  double keyboardHeight = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeMetrics() {
    super.didChangeMetrics();
    if (!i.isCheckKeyboard) {
      return;
    }
    // Detect keyboard visibility changes when the app's metrics change (e.g., when the keyboard opens or closes)

    final v = View.of(context).viewInsets.bottom != 0;
    if (v != isKeyboardVisible) {
      isKeyboardVisible = v;
      keyboardHeight = View.of(context).viewInsets.bottom;
      if (kDebugMode) {}
      setState(() {});
    }
    if (kDebugMode) {}
  }

  @override
  Widget build(BuildContext context) {
    var _isAutoHeight = i.isAutoHeight;
    if (i.isScrollable && (i.height == null)) {
      _isAutoHeight = false;
    }
    final double _fullHeight = ContextHelper.size.height;
    final double _padding = ContextHelper.padding.top + ContextHelper.padding.bottom;
    final double _heightModal = _fullHeight - (_padding + keyboardHeight + 225);
    if (kDebugMode) {}
    return AppGestureDetector(
      onTap: () => app.focusNew(context),
      child: Container(
        //height: 300,
        height: isKeyboardVisible ? _heightModal : i.height,
        decoration: BoxDecoration(
          color: i.backgroundColor ?? app.backgroundDialogColor(context),
          borderRadius: !i.isBorderRadiusStyle ? null : const BorderRadius.only(topLeft: Radius.circular(15.0), topRight: Radius.circular(15.0)),
        ),
        child: SafeArea(
          top: false,
          bottom: i.isSafeAreaBottom,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 45,
                        height: 4,
                        margin: const EdgeInsets.only(top: 8),
                        decoration: BoxDecoration(
                            color: context.isDark ? Colors.white.withOpacity(0.2) : Colors.black12, borderRadius: BorderRadius.circular(5)),
                      ),
                    ],
                  ),
                ],
              ),
              if (i.headWidget != null) ...[
                i.headWidget!
              ] else ...[
                if (i.isClose == false && i.isOK == false && i.title == null)
                  const SizedBox(
                    width: 0,
                    height: 9,
                  )
                else
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Expanded(
                        child: i.title != null
                            ? Container(
                                alignment: i.isTitleCenter ? Alignment.bottomCenter : Alignment.bottomLeft,
                                padding: const EdgeInsets.only(right: 15, top: 20, bottom: 5, left: 15),
                                child: Text(
                                  i.title!,
                                  textAlign: TextAlign.center,
                                  style: app.modalBottomSheetTextStyle(context),
                                ),
                              )
                            : const SizedBox(),
                      ),
                      if (i.isClose || i.isOK) ...[
                        i.isClose && !i.isOK
                            ? GestureDetector(
                                onTap: () => context.navigate.pop().then((_) => i.onClose?.call()),
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 9, 16, 5),
                                  child: Icon(
                                    Icons.close,
                                    size: 25,
                                    color: context.isDark ? Colors.white : const Color(0xFFAAAAAA),
                                  ),
                                ),
                              )
                            : Container(
                                child: i.isOK == true
                                    ? InkWell(
                                        onTap: () => context.navigate.pop().then((_) => i.onOK?.call()),
                                        child: Container(
                                          padding: const EdgeInsets.only(right: 30, top: 20, bottom: 5, left: 5),
                                          child: Text(
                                            'ok'.toUpperCase(),
                                            textAlign: TextAlign.end,
                                            style: context.textTheme.bodySmall,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        padding: EdgeInsets.only(right: 30, top: i.title != null ? 40 : 0, bottom: 5, left: 5),
                                        color: Colors.transparent,
                                        child: const SizedBox(),
                                      ),
                              ),
                      ],
                    ],
                  ),
              ],
              if (i.isShowDiverHead)
                Container(
                  margin: const EdgeInsets.symmetric(vertical: 5),
                  child: Divider(
                    color: context.dividerColor,
                    thickness: 0.9,
                  ),
                ),
              // if(text != null)
              _isAutoHeight
                  ? Container(
                      padding: i.padding,
                      margin: i.margin,
                      color: i.backgroundColor ?? app.backgroundDialogColor(context),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (i.bodyHead != null) i.bodyHead!,
                          i.child,
                        ],
                      ),
                    )
                  : Expanded(
                      child: Container(
                        margin: i.margin,
                        padding: i.padding,
                        color: i.backgroundColor ?? app.backgroundDialogColor(context),
                        child: i.isScrollable
                            ? SingleChildScrollView(
                                physics: app.scrollPhysics,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    if (i.bodyHead != null) i.bodyHead!,
                                    i.child,
                                  ],
                                ),
                              )
                            : i.child,
                      ),
                    ),
              if (i.bottomWidget != null) i.bottomWidget!
            ],
          ),
        ),
      ),
    );
  }
}
