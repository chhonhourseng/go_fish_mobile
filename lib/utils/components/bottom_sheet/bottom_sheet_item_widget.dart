import 'package:app/export.dart';

class BottomSheetItemWidget extends StatelessWidget {
  final AppBottomSheetActionModel data;
  final BoxDecoration? itemBoxDecoration;
  final bool isShowBottomBorder;

  const BottomSheetItemWidget({super.key, required this.data, this.itemBoxDecoration, this.isShowBottomBorder = false});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        InkWell(
          onTap: () => context.navigate.pop().then((_) => data.callbackAction?.call()),
          child: Container(
            padding: const EdgeInsets.symmetric(
              vertical: 8,
            ),
            child: Container(
              padding: itemBoxDecoration == null
                  ? EdgeInsets.zero
                  : const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 8,
                    ),
              decoration: itemBoxDecoration,
              child: Row(
                children: [
                  Expanded(
                    child: Row(
                      children: [
                        data.icon != null
                            ? _showActionWidget(context,
                                isShowDecoration: true,
                                child: Icon(data.icon, size: 21, color: (data.iconColor ?? data.color) ?? app.iconColor(context)))
                            : (data.image != null || data.imagePath != null
                                ? _showActionWidget(
                                    context,
                                    child: (data.image != null
                                        ? data.image!
                                        : (data.imagePath != null
                                            ? AppImageSvg(
                                                path: data.imagePath!,
                                                color: (data.iconColor ?? data.color) ?? app.iconColor(context),
                                                width: 20,
                                                height: 20,
                                                fit: BoxFit.contain)
                                            : const SizedBox())),
                                  )
                                : const SizedBox()),
                        if (data.text != null)
                          Expanded(
                            child: Text(
                              data.text!.toFirstUppercase(),
                              style: context.textTheme.bodyMedium?.copyWith(
                                fontWeight: FontWeight.w600,
                                color: data.color,
                              ),
                            ),
                          )
                      ],
                    ),
                  ),
                  if (data.rightWidget != null)
                    Container(
                      width: 20,
                      height: 20,
                      constraints: const BoxConstraints(maxWidth: 20, maxHeight: 20),
                      child: data.rightWidget,
                    )
                ],
              ),
            ),
          ),
        ),
        if (isShowBottomBorder)
          Divider(
            color: AppColor.lightGreyColor.withOpacity(.5),
          ),
      ],
    );
  }

  static Widget _showActionWidget(
    BuildContext context, {
    required Widget child,
    bool isShowDecoration = false,
  }) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.all(10),
      decoration: isShowDecoration
          ? BoxDecoration(
              color: context.isDark ? const Color(0xFFDCDCDC).withOpacity(.4) : const Color(0xFFDCDCDC),
              shape: BoxShape.circle,
            )
          : null,
      child: Container(
        child: child,
      ),
    );
  }
}
