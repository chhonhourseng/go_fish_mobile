import 'package:devicelocale/devicelocale.dart';
import 'package:flutter/foundation.dart';

///AppSystemInfo
class AppDeviceLocal {
  static String? currentLocale;

  static Future<String?> get instance async {
    currentLocale ??= await Devicelocale.currentLocale;
    return currentLocale!;
  }

  ///
  static Future<String?> init() async {
    currentLocale = await instance;
    if (kDebugMode) {}
    return currentLocale;
  }
}
