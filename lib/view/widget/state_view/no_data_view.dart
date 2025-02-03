import "package:app/export.dart";
import 'package:flutter_svg/flutter_svg.dart';

class NoDataView extends StatelessWidget {
  final String? title;
  final String? typeName;
  final bool isSearch;
  final GestureTapCallback? onTap;
  final bool isShowButton;
  final Color? titleColor;

  const NoDataView({
    this.title,
    this.typeName,
    super.key,
    this.onTap,
    this.isSearch = false,
    this.isShowButton = false,
    this.titleColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isShowButton ? null : onTap,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (!isSearch) ...[
              SvgPicture.asset(AppAssets.missingPictureImage),
              typeName == null
                  ? Text(
                      (title ?? T.noContent.r),
                      style: context.textTheme.headlineMedium!.copyWith(
                        fontWeight: FontWeight.w700,
                        color: titleColor,
                      ),
                    )
                  : Column(
                      children: [
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "no_${typeName}_listing",
                          style: context.textTheme.headlineMedium!.copyWith(
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(
                          height: 7,
                        ),
                        Text(
                          "click_the_add_button_to_add_new_$typeName",
                          style: context.textTheme.labelLarge!.copyWith(
                            fontWeight: FontWeight.w400,
                            color: AppColor.greyLight,
                          ),
                        ),
                      ],
                    ),
            ] else ...[
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    SvgPicture.asset(
                      AppAssets.missingPictureImage,
                      height: 250,
                    ),
                    Positioned(
                      top: 160,
                      left: 0,
                      right: 0,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            "search_no_found",
                            style: context.textTheme.headlineMedium!.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                            textAlign: TextAlign.center,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            "try_a_new_search_change_or_check_another_keyword_again",
                            style: context.textTheme.labelLarge!.copyWith(
                              fontWeight: FontWeight.w400,
                              color: AppColor.greyLight,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
            if (onTap != null && !isSearch && isShowButton) ...[
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
