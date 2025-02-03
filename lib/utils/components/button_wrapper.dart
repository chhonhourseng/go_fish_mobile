import 'package:app/export.dart';

class ButtonWrapper extends StatelessWidget {
  final Widget child;
  final bool isLoading;
  final bool isDisable;

  const ButtonWrapper({
    super.key,
    required this.child,
    this.isLoading = false,
    this.isDisable = false,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Opacity(
          opacity: isLoading || isDisable ? 0.3 : 1,
          child: IgnorePointer(
            ignoring: isLoading || isDisable,
            child: child,
          ),
        ),
        if (isLoading) const AppLoadingWidget(),
      ],
    );
  }
}
