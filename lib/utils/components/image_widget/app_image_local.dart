import 'dart:io' as f;

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

//*Can Use AppImage Widget
class AppImageLocal extends StatelessWidget {
  final String filePath;
  final double? height;
  final double? width;
  final BoxFit fit;

  const AppImageLocal({
    this.filePath = '',
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    super.key,
  });

  bool get isSVG => filePath.split('.').last.contains('svg');

  @override
  Widget build(BuildContext context) {
    if (filePath.isEmpty) return const Offstage();
    if (isSVG) {
      return SvgPicture.file(
        f.File(filePath),
        height: height,
        width: width,
        fit: fit,
      );
    }
    return Image.file(
      f.File(filePath),
      height: height,
      width: width,
      fit: fit,
      errorBuilder: (context, error, stackTrace) {
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
