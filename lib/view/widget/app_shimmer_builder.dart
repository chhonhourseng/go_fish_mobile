import 'package:app/export.dart';

class AppShimmerBuilder extends StatefulWidget {
  final Widget? child;

  const AppShimmerBuilder({
    super.key,
    this.child,
  });

  @override
  State<AppShimmerBuilder> createState() => _AppShimmerBuilderState();
}

class _AppShimmerBuilderState extends State<AppShimmerBuilder> {
  final greyColor = const Color(0xFF8B8A8A);

  @override
  Widget build(BuildContext context) {
    return _AnimationWidget(
      isDark: context.isDark,
      child: widget.child,
    );
    /* return Shimmer.fromColors(
     period: const Duration(milliseconds: 3500),
     baseColor: context.isDark ? greyColor : const Color(0xFFDCDCDC),
     highlightColor: context.isDark ? greyColor : const Color(0xFFCACACA),
     child: widget.child ??
         Container(
           color: context.isDark ? greyColor : const Color(0xFFDCDCDC),
         ),
   );*/
  }
}

class _AnimationWidget extends StatefulWidget {
  final bool isDark;
  final Widget? child;

  const _AnimationWidget({
    required this.isDark,
    required this.child,
  });

  @override
  State<_AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<_AnimationWidget> with SingleTickerProviderStateMixin {
  late AnimationController controllerOne;
  late Animation<Color?> animationOne;

  Color get baseColor => widget.isDark ? greyColor : const Color(0xFFDCDCDC);

  Color get highlightColor => widget.isDark ? AppColor.greyLightI : const Color(0xFFCACACA);

  @override
  void initState() {
    super.initState();
    controllerOne = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
    animationOne = ColorTween(begin: baseColor, end: highlightColor).animate(controllerOne);
    controllerOne.forward();
    controllerOne.addListener(() {
      if (controllerOne.status == AnimationStatus.completed) {
        controllerOne.reverse();
      } else if (controllerOne.status == AnimationStatus.dismissed) {
        controllerOne.forward();
      }
      setState(() {});
    });
  }

  @override
  void dispose() {
    controllerOne.dispose();
    super.dispose();
  }

  final greyColor = const Color(0xFF8B8A8A);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (rect) {
        return LinearGradient(tileMode: TileMode.clamp, colors: [animationOne.value ?? AppColor.greyLight, animationOne.value ?? AppColor.greyLightI])
            .createShader(rect);
      },
      child: widget.child ??
          Container(
            color: widget.isDark ? greyColor : const Color(0xFFDCDCDC),
          ),
    );
  }
}
