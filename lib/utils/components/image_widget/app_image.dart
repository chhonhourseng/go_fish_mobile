import 'package:flutter/material.dart';

import 'package:app/utils/components/image_widget/_index_.dart';

class AppImage extends StatelessWidget {
  final String imageUrl;
  final double? height;
  final double? width;
  final BoxFit fit;
  const AppImage(
    this.imageUrl, {
    this.fit = BoxFit.contain,
    this.width,
    this.height,
    super.key,
  });

  bool get isNetwork => imageUrl.startsWith('http');
  bool get isAssets => Uri.tryParse(imageUrl)?.pathSegments.contains('assets') ?? false;

  @override
  Widget build(BuildContext context) {
    if (isNetwork) {
      return AppImageNetwork(
        imageUrl: imageUrl,
        width: width,
        height: height,
        fit: fit,
      );
    }

    if (isAssets) {
      return AppImageAsset(
        asset: imageUrl,
        fit: fit,
        width: width,
        height: height,
      );
    }

    return AppImageLocal(
      filePath: imageUrl,
      fit: fit,
    );
  }
}
