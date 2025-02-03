import 'package:app/export.dart';

class CustomScrollbar extends StatelessWidget {
  final double? customWidth;
  final double radius;
  final Color thumbColor;
  final Color trackColor;
  final double? minThumbLength;

  const CustomScrollbar({
    super.key,
    required this.child,
    this.customWidth,
    this.radius = 0,
    this.thumbColor = AppColor.primaryColor,
    this.trackColor = AppColor.greyLightII,
    this.minThumbLength,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, c) {
      return ClipRect(
        child: RawScrollbar(
          thickness: 5,
          trackRadius: radius.radius(),
          radius: radius.radius(),
          thumbVisibility: true,
          trackVisibility: true,
          minThumbLength: minThumbLength ?? 18,
          trackBorderColor: Colors.transparent,
          trackColor: trackColor,
          thumbColor: thumbColor,
          padding: ((c.maxWidth / 2) * (customWidth ?? .9)).px(),
          child: child,
        ),
      );
    });
  }
}
