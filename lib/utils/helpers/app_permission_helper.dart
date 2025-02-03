import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:app/export.dart';
import 'package:permission_handler/permission_handler.dart';

class AppPermissionHelper {
  static Future<bool> check(
    BuildContext context, {
    Permission permission = Permission.camera,
    bool isShowMessage = true,
  }) async {
    if ((kIsWeb ? false : Platform.isIOS)) {
      if (permission == Permission.storage) {
        permission = Permission.camera;
      }
    }
    var status = await permission.status;
    if (status.isPermanentlyDenied) {
      if (isShowMessage) {
        //AppSnackBar.show(context, content: 'permission_denied'.tr().toFirstUppercase());
      }
      return false;
    } else if (status.isDenied || !status.isGranted) {
      try {
        if (await permission.request().isGranted) {
          return true;
        }
      } catch (_) {}
    } else if (status.isGranted) {
      return true;
    }
    if (isShowMessage) {
      app.snackBar.show(T.permissionDenied.r, type: SnackBarType.error);
    }
    return false;
  }
}
