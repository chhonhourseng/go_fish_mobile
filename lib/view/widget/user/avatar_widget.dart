import 'package:app/export.dart';
import 'package:random_avatar/random_avatar.dart';

class AvatarWidget extends StatelessWidget {
  final String? id;
  final String? url;
  final File? file;
  final bool isShowEditIcon;
  final double? progress;

  const AvatarWidget({
    super.key,
    this.id,
    this.url,
    this.file,
    this.isShowEditIcon = false,
    this.progress,
  });

  Widget get getRandomAvatar {
    return RandomAvatar(id ?? DateTime.now().toIso8601String());
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: AlignmentDirectional.center,
      children: [
        Opacity(
          opacity: progress != null ? 0.3 : 1,
          child: AspectRatio(
            aspectRatio: 1,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(1000),
              child: file == null
                  ? (url != null
                      ? AppImageNetworkWidget(
                          fit: BoxFit.cover,
                          url: url,
                          errorBuilder: (context) => errorWidget,
                        )
                      : errorWidget)
                  : Image.file(
                      File(file?.path ?? ''),
                      fit: BoxFit.cover,
                    ),
            ),
          ),
        ),
        if (isShowEditIcon)
          Positioned(
            right: 0,
            bottom: 0,
            child: Opacity(
              opacity: progress != null ? 0.3 : 1,
              child: Container(
                padding: 3.p(),
                decoration: BoxDecoration(
                  borderRadius: 5.r(),
                  color: Colors.white,
                  //border: Border.all(color: AppColor.greyLight, width: 0.3),
                ),
                child: const Icon(
                  Icons.photo_camera_outlined,
                  color: AppColor.greyLight,
                ),
              ),
            ),
          ),
        if (progress != null)
          Positioned.fill(
            child: CircularProgressIndicator(
              color: AppColor.primaryColor,
              value: progress,
              strokeWidth: 5,
              backgroundColor: AppColor.primaryColor.withOpacity(0.2),
            ),
          ),
      ],
    );
  }

  Widget get errorWidget {
    if (id != null) {
      return getRandomAvatar;
    }
    return Image.asset(
      AppAssets.defaultProfileImage,
      fit: BoxFit.cover,
    );
  }
}
