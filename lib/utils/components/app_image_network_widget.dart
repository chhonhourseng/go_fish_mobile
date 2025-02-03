import 'package:app/export.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';

class AppImageNetworkWidget extends StatelessWidget {
  final String? url;
  final BoxFit fit;
  final String? errorAsset;
  final double? aspectRatio;
  final TypeOfImageSize size;
  final Color? backgroundColorDuringLoading;
  final Widget Function(BuildContext context)? errorBuilder;

  const AppImageNetworkWidget({
    super.key,
    required this.url,
    this.fit = BoxFit.cover,
    this.errorAsset,
    this.aspectRatio,
    this.size = TypeOfImageSize.medium,
    this.backgroundColorDuringLoading,
    this.errorBuilder,
  });

  String? get getSize {
    switch (size) {
      case TypeOfImageSize.biggest:
        return '700';
      case TypeOfImageSize.big:
        return '500';
      case TypeOfImageSize.small:
        return '180';
      case TypeOfImageSize.smallx2:
        return '100';
      case TypeOfImageSize.smallest:
        return '40';
      case TypeOfImageSize.none:
        return null;
      default:
        return '300';
    }
  }

  String get getUrl {
    return (url == null ? true : url!.isEmpty) ? "" : (getSize == null ? url! : '$url?width=$getSize');
  }

  Widget get getBuild {
    String _url = getUrl;
    if (kIsWeb) {
      return Image.network(
        _url,
        errorBuilder: (context, a, b) => Image.asset(
          errorAsset ?? AppAssets.missingPictureImage,
          fit: BoxFit.cover,
        ),
        fit: fit,
      );
    }
    return CachedNetworkImage(
      imageUrl: _url,
      placeholder: (context, url) => getLoading(context, backgroundColor: backgroundColorDuringLoading),
      errorWidget: (context, error, stackTrace) => errorBuilder?.call(context) ?? errorWidget(context),
      fit: fit,
    );
  }

  Widget errorWidget(BuildContext context) {
    final v = Image.asset(
      errorAsset ?? AppAssets.missingPictureImage,
      fit: BoxFit.cover,
      color: Colors.white.withOpacity(context.isDark ? 0.6 : 1),
      colorBlendMode: BlendMode.modulate,
    );
    return (aspectRatio == null ? false : aspectRatio! > 0)
        ? AspectRatio(
            aspectRatio: aspectRatio!,
            child: v,
          )
        : v;
  }

  Widget getLoading(BuildContext context, {Color? backgroundColor}) {
    final v = AppShimmerBuilder(
      child: Container(
        color: backgroundColor ?? context.dividerColor,
      ),
    );
    return LayoutBuilder(builder: (context, c) {
      return (aspectRatio == null ? false : aspectRatio! > 0)
          ? AspectRatio(
              aspectRatio: aspectRatio!,
              child: v,
            )
          : SizedBox(
              height: c.maxWidth * 0.4,
              child: v,
            );
    });
  }

  @override
  Widget build(BuildContext context) {
    return (aspectRatio == null ? false : aspectRatio! > 0)
        ? AspectRatio(
            aspectRatio: aspectRatio!,
            child: getBuild,
          )
        : getBuild;
  }
}
