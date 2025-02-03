import 'package:app/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ErrorViewWidget extends StatelessWidget {
  final GestureTapCallback? onTap;
  final String? title;
  final bool isShowButton;

  const ErrorViewWidget({
    this.onTap,
    super.key,
    this.title,
    this.isShowButton = true,
  });

  @override
  Widget build(BuildContext context) {
    bool _isShowButton = onTap != null && isShowButton;
    return GestureDetector(
      onTap: _isShowButton ? null : onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.missingPictureImage),
            Text(
              (title ?? T.somethingUnexpectedWentWrong.r),
              textAlign: TextAlign.center,
              style: context.textTheme.headlineMedium!.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            if (_isShowButton) ...[
              const SizedBox(
                height: 24,
              ),
              FilledButton(
                onPressed: onTap,
                child: Text(T.tryAgain.r),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
