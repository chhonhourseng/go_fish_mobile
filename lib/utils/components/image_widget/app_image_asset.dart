import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

//*Can Use AppImage Widget
class AppImageAsset extends StatelessWidget {
  final String asset;
  final double? height;
  final double? width;
  final BoxFit fit;

  const AppImageAsset({
    this.asset = '',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    super.key,
  });

  bool get isSVG => asset.split('.').last.contains('svg');

  @override
  Widget build(BuildContext context) {
    if (asset.isEmpty) return const Offstage();

    if (isSVG) {
      return SvgPicture.asset(
        asset,
        fit: fit,
        height: height,
        width: width,
      );
    }

    return Image.asset(
      asset,
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, url, error) {
        return LayoutBuilder(builder: (context, constraints) {
          return Container(
            padding: EdgeInsets.symmetric(
              horizontal: constraints.maxWidth * 0.15,
              vertical: constraints.maxHeight * 0.15,
            ),
            child: Image.asset(
              '', // Assets.pngDefault,
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
