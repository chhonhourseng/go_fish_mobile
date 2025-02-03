import 'package:app/export.dart';

class FormValidationHelper {
  String? require(String? value, [String? fieldName]) {
    if (value?.isEmpty ?? true) {
      return T.isRequired.arg([fieldName ?? T.field.r]);
    }
    return null;
  }

  String? isEmailRequire(String? value, [String? fieldName]) {
    return require(value, fieldName) ?? isEmail(value);
  }

  String? isEmail(String? value) {
    if (value?.isNotEmpty ?? false) {
      if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value!)) {
        return T.plsEnterAValidEmailAddress.r;
      }
    }
    return null;
  }

  String? isNumberRequire(String? value, [String? fieldName]) {
    return require(value, fieldName) ?? isNumber(value);
  }

  String? isNumber(String? value) {
    if (value?.isNotEmpty ?? false) {
      if (int.tryParse(value!) == null) {
        return T.plsEnterAValidNumber.r;
      }
    }
    return null;
  }

  String? isUrlRequire(String? value, [String? fieldName]) {
    return require(value, fieldName) ?? isUrl(value);
  }

  String? isUrl(String? value) {
    if (value?.isNotEmpty ?? false) {
      if (!_isUrl(value!)) {
        return T.plsEnterAValidURL.r;
      }
    }
    return null;
  }

  String? isNativeUrlRequire(String? value, [String? fieldName]) {
    return require(value, fieldName) ?? isNativeUrl(value);
  }

  String? isNativeUrl(String? value) {
    if (value?.isNotEmpty ?? false) {
      if (!Uri.parse(value!).isAbsolute) {
        return T.plsEnterAValidURL.r;
      }
    }
    return null;
  }

  bool _isUrl(String value) {
    // Regular expression pattern to match URLs without http:// or https://
    RegExp regExp = RegExp(
      r'^(?:https?:\/\/)?(?:www\.)?[a-zA-Z0-9-]+(?:\.[a-zA-Z]{2,})+$',
      caseSensitive: false,
      multiLine: false,
    );
    return regExp.hasMatch(value);
  }
}
