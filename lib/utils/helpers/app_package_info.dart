import 'package:flutter/foundation.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppPackageInfo {
  AppPackageInfo._();

  static PackageInfo? getInstance;

  static Future<PackageInfo?> get instance async {
    getInstance ??= await PackageInfo.fromPlatform();
    return getInstance!;
  }

  ///
  static Future init() async {
    getInstance = await instance;
    if (kDebugMode) {}
    return getInstance;
  }
}
