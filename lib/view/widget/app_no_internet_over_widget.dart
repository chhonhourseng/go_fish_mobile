import 'package:app/export.dart';

class AppNoInternetOverWidget extends StatefulWidget {
  final Widget child;
  final bool isShow;

  const AppNoInternetOverWidget({
    Key? key,
    required this.child,
    this.isShow = false,
  }) : super(key: key);

  @override
  State<AppNoInternetOverWidget> createState() => _AppNoInternetOverWidgetState();
}

class _AppNoInternetOverWidgetState extends State<AppNoInternetOverWidget> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: context.mediaQuery.size.width,
          child: widget.child,
        ),
        if (widget.isShow)
          Positioned(
            left: 0,
            right: 0,
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 9),
              decoration: const BoxDecoration(
                color: Colors.red,
              ),
              child: Row(
                children: [
                  const AppImageSvg(
                    path: AppAssets.missingPictureImage,
                    isDefaultColor: true,
                    fit: BoxFit.contain,
                    width: 26,
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'no_connection',
                          style: context.textTheme.labelLarge?.copyWith(
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'please_check_your_connection',
                          style: context.textTheme.labelSmall?.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
      ],
    );
  }
}
