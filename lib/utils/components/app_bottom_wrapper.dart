import 'package:app/export.dart';
import 'dart:io' show Platform;

class AppBottomWrapper extends StatelessWidget {
  final Widget child;
  final bool isBoxShadow;
  final bool isWithPadding;
  final double marginTop;

  const AppBottomWrapper({
    super.key,
    required this.child,
    this.isBoxShadow = false,
    this.isWithPadding = true,
    this.marginTop = 10,
  });

  @override
  Widget build(BuildContext context) {
    final double keyBordBottom = MediaQuery.of(context).viewInsets.bottom;
    final double padding = ContextHelper.bottom;
    final double bottom = (keyBordBottom > 0 ? keyBordBottom + 10 : padding + keyBordBottom);
    return Container(
      width: context.mediaQuery.size.width,
      decoration: BoxDecoration(
        color: context.isDark ? Colors.transparent : Colors.white,
        boxShadow: !isBoxShadow
            ? null
            : [
                BoxShadow(
                  blurRadius: 3,
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, -5),
                  spreadRadius: 1,
                ),
              ],
      ),
      child: AnimatedContainer(
        curve: Curves.fastOutSlowIn,
        duration: const Duration(milliseconds: 50),
        margin: EdgeInsets.only(
          top: marginTop,
          bottom: bottom < padding ? padding : bottom,
          left: isWithPadding ? 16 : 0,
          right: isWithPadding ? 16 : 0,
        ),
        child: child,
      ),
    );
  }
}
