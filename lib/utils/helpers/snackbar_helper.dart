import 'package:app/export.dart';

enum SnackBarType { info, success, warning, error }

class SnackBarHelper {
  final _context = app.context;

  void show(
    String msg, {
    String title = '',
    SnackBarType type = SnackBarType.info,
  }) {
    ScaffoldMessenger.of(_context).removeCurrentSnackBar();
    ScaffoldMessenger.of(_context).showSnackBar(
      SnackBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        padding: const EdgeInsets.fromLTRB(
          16,
          0,
          16,
          16,
        ),
        content: Container(
          padding: const EdgeInsets.all(16),
          margin: EdgeInsets.only(bottom: MediaQuery.of(_context).viewInsets.bottom),
          decoration: BoxDecoration(
            color: _getBackgroundColor(type),
            borderRadius: BorderRadius.circular(16),
            // border: Border.all(color: _getBorderColor(type), width: 2),
          ),
          child: Row(
            children: [
              Icon(
                getIcon(type),
                color: _getIconColor(type),
              ),
              /* SvgPicture.asset(
                _getIcon(type),
                colorFilter: ColorFilter.mode(_getIconColor(type), BlendMode.srcIn),
              ),*/
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (title.isNotEmpty)
                      Text(
                        title,
                        style: _context.textTheme.bodyMedium?.copyWith(
                          color: _getBorderColor(type),
                        ),
                        // style: TextStyle(
                        //   color: _getBorderColor(type),
                        //   fontWeight: FontWeight.bold,
                        // ),
                      ),
                    Text(
                      msg,
                      style: _context.textTheme.bodyMedium,
                      // style: TextStyle(
                      //   color: _getTextColor(type),
                      //   fontWeight: FontWeight.bold,
                      // ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Color _getBorderColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.info:
        return AppColor.infoColor;
      case SnackBarType.success:
        return AppColor.infoColor;
      case SnackBarType.error:
        return AppColor.infoColor;
      case SnackBarType.warning:
        return AppColor.infoColor;
      default:
        return AppColor.infoColor;
    }
  }

  Color _getBackgroundColor(SnackBarType type) {
    switch (type) {
      case SnackBarType.info:
        return AppColor.infoColor.lighten(90);
      case SnackBarType.success:
        return AppColor.success.lighten(80);
      case SnackBarType.error:
        return AppColor.danger.lighten(90);
      case SnackBarType.warning:
        return AppColor.warning.lighten(85);
      default:
        return AppColor.infoColor.lighten(90);
    }
  }
}

Color _getIconColor(SnackBarType type) {
  switch (type) {
    case SnackBarType.info:
      return AppColor.infoColor;
    case SnackBarType.success:
      return AppColor.success;
    case SnackBarType.error:
      return AppColor.danger;
    case SnackBarType.warning:
      return AppColor.warning;
    default:
      return AppColor.infoColor;
  }
}

IconData getIcon(SnackBarType type) {
  switch (type) {
    case SnackBarType.info:
      return Icons.info_outline_rounded;
    case SnackBarType.success:
      return Icons.check;
    case SnackBarType.error:
      return Icons.error_outline_outlined;
    case SnackBarType.warning:
      return Icons.warning_amber;
    default:
      return Icons.info_outline_rounded;
  }
}

String _getIcon(SnackBarType type) {
  switch (type) {
    case SnackBarType.info:
      return AppAssets.missingPictureImage;
    case SnackBarType.success:
      return AppAssets.missingPictureImage;
    case SnackBarType.error:
      return AppAssets.missingPictureImage;
    case SnackBarType.warning:
      return AppAssets.missingPictureImage;
    default:
      return AppAssets.missingPictureImage;
  }
}

String capitalize(String text) {
  if (text.isEmpty) return text;

  return text[0].toUpperCase() + text.substring(1);
}

SnackBarType stringToType(String title) {
  switch (title.toLowerCase()) {
    case 'success':
      return SnackBarType.success;
    case 'warning':
      return SnackBarType.warning;
    case 'info':
      return SnackBarType.info;
    case 'danger':
      return SnackBarType.error;
    default:
      return SnackBarType.info;
  }
}
