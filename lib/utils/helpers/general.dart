import 'dart:developer';

import 'package:app/export.dart';
import 'package:chalk/chalk.dart';

AppGlobal get app => AppGlobal();

bool checkKeyMap(Map? arr, dynamic key) {
  if (arr == null || key == null) {
    return false;
  }
  return arr.containsKey(key);
}

num? maybeNumFromDynamicJson(dynamic data) {
  if (data == null) {
    return null;
  }
  return numFromDynamicJson(data);
}

num numFromDynamicJson(dynamic data) {
  try {
    final startNumRegEx = RegExp(r'^[0-9,]+(.[0-9,]+)?');
    if (data is String) {
      try {
        return num.parse(data);
      } catch (_) {
        if (startNumRegEx.hasMatch(data)) {
          return num.parse(
              startNumRegEx.firstMatch(data)!.group(0)!.replaceAll(',', ''));
        }
        rethrow;
      }
    } else if (data is num) {
      return data;
    } else {
      return 0;
    }
  } catch (e) {
    return 0;
  }
}


Color getColorFromData(dynamic colorData) {
  if (colorData is Color) {
    return colorData;
  } else if (colorData is String) {
    return Color(hexFromString(colorData));
  } else if (colorData is int) {
    return Color(colorData);
  }
  return Colors.transparent;
}

int hexFromString(String hexString) {
  return int.parse(
    hexString.replaceFirst(RegExp(r'^#?(0[xX])?'), '').padLeft(8, 'F'),
    radix: 16,
  );
}


void printInfo(dynamic message) {
  if (kDebugMode) {
    print('💡 ' + chalk.blue(message.toString()));
  }
}

void printSuccess(dynamic message) {
  if (kDebugMode) {
    print('✅ ' + chalk.green(message.toString()));
  }
}

void printError(dynamic message) {
  if (kDebugMode) {
    print('❌ ' + chalk.red(message.toString()));
  }
}

void printWarning(dynamic message) {
  if (kDebugMode) {
    print('❔ ' + chalk.yellow(message.toString()));
  }
}

void logInfo(dynamic message, {String? name}) {
  if (kDebugMode) {
    log('💡 ' + chalk.blue(message.toString()), name: name ?? '');
  }
}

void logSuccess(dynamic message, {String? name}) {
  if (kDebugMode) {
    log('✅ ' + chalk.green(message.toString()), name: name ?? '');
  }
}

void logError(dynamic message, {String? name}) {
  if (kDebugMode) {
    log('❌ ' + chalk.red(message.toString()), name: name ?? '');
  }
}

void logWarning(dynamic message, {String? name}) {
  if (kDebugMode) {
    log('❔ ' + chalk.yellow(message.toString()), name: name ?? '');
  }
}
