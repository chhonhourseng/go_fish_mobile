import 'package:app/export.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NoInternetView extends StatelessWidget {
  final GestureTapCallback? onTap;

  const NoInternetView({
    super.key,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              SvgPicture.asset(AppAssets.missingPictureImage),
              Positioned(
                bottom: 15,
                left: 0,
                right: 0,
                child: Center(
                  child: Text(
                    "no_internet_connection",
                    style: context.textTheme.headlineMedium!.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text(
            "make_sure_your_wifi_or_cellular_is_turned_on_and_than_tap_try_again",
            textAlign: TextAlign.center,
            style: context.textTheme.labelLarge!.copyWith(
              fontWeight: FontWeight.w400,
              color: AppColor.greyLight,
            ),
          ),
          if (onTap != null) ...[
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
    );
  }
}
