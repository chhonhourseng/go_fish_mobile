import 'package:app/export.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class LoadingShimmerView extends StatelessWidget {
  const LoadingShimmerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: const Duration(seconds: 3),
      interval: const Duration(seconds: 1),
      color: AppColor.whiteColor,
      enabled: true,
      direction: const ShimmerDirection.fromLTRB(),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          _itemLoadingScreen(context),
          const SizedBox(
            height: 26,
          ),
          _itemLoadingScreen(context),
          const SizedBox(
            height: 100,
          ),
        ],
      ),
    );
  }

  Widget _line(BuildContext context, int minus) {
    return Container(
      height: 15,
      color: AppColor.lightGreyColor.withOpacity(0.7),
      width: MediaQuery.of(context).size.width - minus,
    );
  }

  Widget _itemLoadingScreen(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 200,
          color: AppColor.lightGreyColor,
        ),
        const SizedBox(
          height: 12,
        ),
        Stack(
          children: [
            Row(
              children: [
                const SizedBox(
                  width: 64,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _line(context, 100),
                      const SizedBox(
                        height: 12,
                      ),
                      _line(context, 150),
                      const SizedBox(
                        height: 12,
                      ),
                      _line(context, 250),
                    ],
                  ),
                )
              ],
            ),
            Positioned(
              top: 0,
              left: 16,
              child: Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: AppColor.lightGreyColor,
                  borderRadius: BorderRadius.circular(25),
                ),
              ),
            )
          ],
        )
      ],
    );
  }
}
