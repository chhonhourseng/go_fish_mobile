import 'dart:io';

import 'package:apple_product_name/apple_product_name.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_udid/flutter_udid.dart';
import 'package:app/export.dart';

class DeviceInfoHelper {
  static DeviceInfoModel? instance;

  static Future<void> init() async {
    try {
      if (kIsWeb) {
        instance = DeviceInfoModel(
          name: 'web',
          deviceOs: 'web',
          deviceId: 'web',
          version: 'web',
        );
      }
      var _info = DeviceInfoPlugin();
      if (Platform.isAndroid) {
        var info = await _info.androidInfo;
        instance = DeviceInfoModel(
          name: "${info.manufacturer} ${info.brand}",
          deviceOs: 'android',
          deviceId: info.id,
          version: info.version.release,
        );
      } else {
        final info = await _info.iosInfo;
        final udid = await FlutterUdid.udid;
        instance = DeviceInfoModel(
          name: info.utsname.productName,
          deviceOs: 'ios',
          version: info.systemVersion,
          deviceId: udid,
        );
      }
    } catch (_) {
    }
  }
}
