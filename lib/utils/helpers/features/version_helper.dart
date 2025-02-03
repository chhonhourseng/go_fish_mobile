import 'package:app/export.dart';
import 'package:flutter/foundation.dart';

class VersionHelper {
  static bool isServerVersionBigger(String latestVersion, String version) {
    var serverVersion = latestVersion.split('.').map((e) => int.parse(e)).toList();
    var deviceVersion = version.split('.').map((e) => int.parse(e)).toList();
    if (kDebugMode) {}
    for (var i = 0; i < serverVersion.length; i++) {
      if (serverVersion[i] > deviceVersion[i]) {
        return true;
      } else if (serverVersion[i] < deviceVersion[i]) {
        return false;
      }
    }
    return false;
  }
}
