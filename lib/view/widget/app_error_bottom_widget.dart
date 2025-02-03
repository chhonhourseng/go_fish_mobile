import 'package:app/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AppErrorBottomWidget extends StatelessWidget {
  final String? message;
  final AppStateStatus status;
  final GestureTapCallback? onTap;

  const AppErrorBottomWidget({
    super.key,
    this.message,
    this.onTap,
    this.status = AppStateStatus.none,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 5,
        bottom: 30 + MediaQuery.of(context).padding.bottom,
      ),
      child: Column(
        children: [
          if (status != AppStateStatus.empty) ...[
            Text(
              status == AppStateStatus.noInternet ? T.noInternetConnection.r : (message ?? T.somethingUnexpectedWentWrong.r),
              style: context.textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
          ] else ...[
            const SizedBox(
              height: 15,
            ),
            SvgPicture.asset(AppAssets.missingPictureImage),
            Text(
              T.noContent.r,
              style: context.textTheme.headlineMedium?.copyWith(
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 15,
            ),
          ],
          if (onTap != null && status != AppStateStatus.empty) ...[
            InkWell(
              onTap: onTap,
              splashColor: Colors.grey.withOpacity(0.3),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 75),
                decoration: BoxDecoration(
                  color: context.isDark ? Colors.grey[700]! : Colors.transparent,
                  border: Border.all(
                    width: 1,
                    color: context.isDark ? Colors.transparent : Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(4),
                ),
                child: Text(
                  T.tryAgain.r,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
              ),
            )
          ],
        ],
      ),
    );
  }
}
