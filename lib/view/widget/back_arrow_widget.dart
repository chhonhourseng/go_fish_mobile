import 'package:app/export.dart';

class BackArrowWidget extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isColorWhite;
  final EdgeInsets? padding;
  final bool isCycle;
  final Color? iconColor;
  final IconData? icon;

  const BackArrowWidget({
    super.key,
    this.onPressed,
    this.isColorWhite = false,
    this.padding,
    this.isCycle = false,
    this.iconColor,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppGestureDetector(
          onTap: () {
            if (onPressed != null) {
              onPressed?.call();
            } else {
              Navigator.pop(context);
            }
          },
          child: Container(
            margin: padding == null ? EdgeInsets.only(left: isCycle ? 6 : 16) : null,
            child: AppButtonCycleWidget(
              padding: 0,
              isCycle: isCycle,
              child: AppImageSvg(
                path: AppAssets.backArrowSvg,
                width: 27,
                isDefaultColor: false,
                color: iconColor ?? (isColorWhite ? Colors.white : null),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
