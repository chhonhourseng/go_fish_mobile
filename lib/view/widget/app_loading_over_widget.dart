import 'package:app/export.dart';

class AppLoadingOverWidget extends StatefulWidget {
  final Widget child;
  final bool isShowLoading;

  const AppLoadingOverWidget({
    super.key,
    required this.child,
    this.isShowLoading = false,
  });

  @override
  State<AppLoadingOverWidget> createState() => _AppLoadingOverWidgetState();
}

class _AppLoadingOverWidgetState extends State<AppLoadingOverWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: context.mediaQuery.size.width,
          child: widget.child,
        ),
        if (widget.isShowLoading)
          Positioned(
            left: 0,
            right: 0,
            top: 5,
            child: Center(
              child: Container(
                margin: const EdgeInsets.symmetric(vertical: 8),
                padding: const EdgeInsets.symmetric(horizontal: 7, vertical: 7),
                width: 35,
                height: 35,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                child: const CircularProgressIndicator(),
              ),
            ),
          ),
      ],
    );
  }
}
