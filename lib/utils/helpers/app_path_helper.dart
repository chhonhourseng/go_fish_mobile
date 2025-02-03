import 'dart:io';

import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

class AppPathHelper {
  static final AppPathHelper instance = AppPathHelper._init();

  static String? _path;

  AppPathHelper._init();

  static Future init() async {
    if (_path != null) return;
    _path = (await getApplicationDocumentsDirectory()).path;
    return _path;
  }

  static String get getPath => _path!;

  static Future<void> createPath(String path) async {
    final Directory directory = Directory(p.join(getPath, path));
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  }

  static bool isPhoto(String extension) {
    if (extension == 'jpg' || extension == 'png' || extension == 'jpeg' || extension == 'gif' || extension == 'webp') {
      return true;
    }
    return false;
  }

  static Future<void> removePath(String path) async {
    final Directory directory = Directory(p.join(getPath, path));
    if (await directory.exists()) {
      await directory.delete(recursive: true);
    }
  }

  static String getExtension(String value, {bool withDot = true}) {
    String extension = p.extension(value);
    if (withDot) return extension;
    return extension.replaceFirst('.', '');
  }

  static String getNameWithExtension(String value) {
    return p.basename(value);
  }
}
