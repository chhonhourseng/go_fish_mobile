import 'package:app/export.dart';

class AppDialog extends AppBottomSheet {
  const AppDialog({
    required super.child,
    super.title,
    super.isTitleCenter = false,
    super.buttonText = "Show Dialog",
    super.backgroundColor,
    super.padding,
    super.margin,
    super.onOK,
    super.onClose,
    super.isOK = false,
    super.isClose = true,
  });

  Future<void> show(BuildContext context) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.transparent,
          contentPadding: 0.p(),
          content: SizedBox(
            width: double.maxFinite,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                $ShowDialogBuilder(i: this),
              ],
            ),
          ),
        );
      },
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
    String? subTitle,
  }) {
    return AppDialog(
      isClose: false,
      child: Container(
        padding: app.screenPadding,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(subTitle ?? T.areYouSure.r, style: context.textTheme.labelMedium),
            Text(title, style: context.textTheme.headlineMedium),
            1.sh(),
            Row(
              children: [
                Expanded(
                    child: FilledButton(
                        style: FilledButton.styleFrom(
                          backgroundColor: customYesBackgroundColor,
                        ),
                        onPressed: () {
                          context.navigate.pop();
                          onYes?.call();
                        },
                        child: Text(customYesText ?? T.yes.r))),
                10.sw(),
                Expanded(
                    child: OutlinedButton(
                        onPressed: () {
                          context.navigate.pop();
                          onNo?.call();
                        },
                        child: Text(customNoText ?? T.no.r))),
              ],
            ),
          ].separator((i) => 10.sh()),
        ),
      ),
    ).show(context);
  }
}

class $ShowDialogBuilder extends StatefulWidget {
  final AppDialog i;

  const $ShowDialogBuilder({
    super.key,
    required this.i,
  });

  @override
  State<$ShowDialogBuilder> createState() => _$ShowDialogBuilderState();
}

class _$ShowDialogBuilderState extends State<$ShowDialogBuilder> with WidgetsBindingObserver {
  AppDialog get i => widget.i;

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
  Widget build(BuildContext context) {
    return AppGestureDetector(
      onTap: () => app.focusNew(context),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          decoration: BoxDecoration(
            color: i.backgroundColor ?? app.backgroundDialogColor(context),
            borderRadius: !i.isBorderRadiusStyle ? null : BorderRadius.circular(15),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
                              onTap: i.onClose ??
                                  () {
                                    context.navigate.pop();
                                  },
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
                                      onTap: i.onOK ??
                                          () {
                                            context.navigate.pop();
                                          },
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
              Container(
                padding: i.margin ?? 15.p(t: 0),
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
              ),
            ],
          ),
        ),
      ),
    );
  }
}
