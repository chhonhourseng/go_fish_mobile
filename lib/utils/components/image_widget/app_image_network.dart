import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//*Can Use AppImage Widget
class AppImageNetwork extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;

  const AppImageNetwork({
    required this.imageUrl,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    super.key,
  });

  bool get isSVG => imageUrl.split('.').last.toLowerCase() == 'svg';

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) return const Offstage();
    if (isSVG) {
      return SvgPicture.network(
        imageUrl,
        height: height,
        width: width,
        fit: fit,
      );
    }
    return CachedNetworkImage(
      imageUrl: imageUrl,
      height: height,
      width: width,
      fit: fit,
      fadeInCurve: Curves.fastOutSlowIn,
      fadeInDuration: const Duration(milliseconds: 250),
      progressIndicatorBuilder: (context, url, progress) {
        if (progress.progress == null) return const Offstage();
        if (progress.progress == 1) return const Offstage();
        return SizedBox(
          height: height,
          width: width,
          child: Center(
            child: CircularProgressIndicator(
              value: progress.progress,
              strokeCap: StrokeCap.round,
            ),
          ),
        );
      },
      errorWidget: (context, url, error) {
        return LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.15,
              vertical: constraints.maxHeight * 0.15,
            ),
            child: Image.asset(
              '', //Assets.pngDefault,
              height: constraints.maxHeight,
              width: constraints.maxWidth,
              fit: BoxFit.contain,
            ),
          );
        });
      },
    );
  }
}
