import 'package:app/export.dart';

class AppShimmerWidget extends StatelessWidget {
  final double? width;
  final double? height;
  final bool isCircle;

  const AppShimmerWidget({
    super.key,
    this.width,
    this.height,
    this.isCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width ?? 50,
      height: height ?? 10,
      decoration: BoxDecoration(
        color: context.isDark ? const Color(0xFF767676) : const Color(0xFFDCDCDC),
        shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
      ),
    );
  }
}
