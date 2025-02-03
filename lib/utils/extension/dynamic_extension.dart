import 'package:numeral/numeral.dart';
import 'package:intl/intl.dart';

extension DynamicExtension on dynamic {
  String toFirstUppercase() {
    try {
      return "${this![0].toUpperCase()}${this!.substring(1)}";
    } catch (_) {
      return this;
    }
  }

  String toFirstUppercaseWord() {
    try {
      String stringWord = '';
      List<String> stringList = this!.split(' ');
      if (stringList == null ? false : (stringList.isNotEmpty)) {
        for (var v in stringList) {
          stringWord = "${stringWord == '' ? stringWord : '$stringWord '}${v[0].toUpperCase()}${v.substring(1)}";
        }
        return stringWord;
      }
      return "${this![0].toUpperCase()}${this!.substring(1)}";
    } catch (_) {
      return this;
    }
  }

  String toAppRemoveFirstZero() {
    try {
      String _text = toString().toAppString()!;
      if (_text[0] == "0") {
        return _text.substring(1);
      } else {
        return this;
      }
    } catch (_) {
      return this;
    }
  }

  String? toAppString({String? defaultVal = ''}) {
    String text = '$this';
    return text == 'null' || text.isEmpty ? defaultVal : text.trim();
  }

  String toTrTest() {
    String tr = toString().toAppString()!;
    return tr;
  }

  double toAppDouble({double defaultVal = 0.0}) {
    double coNum = this == null || this == 'null' || this == '' ? defaultVal : double.parse('$this');
    return coNum;
  }

  int toAppInt({int defaultVal = 0}) {
    int coNum = this == null || this == 'null' || this == '' ? defaultVal : (double.tryParse('$this') ?? 0.0).toInt();
    return coNum;
  }

  bool? toAppBool({bool? defaultVal = false}) {
    return this ?? defaultVal;
  }

  String toAppNumeral() {
    try {
      int num = toString().toAppString()!.toAppInt();
      return Numeral(num).format(fractionDigits: 1);
    } catch (_) {
      return toString().toAppString()!;
    }
  }

  String toAppNumber() {
    try {
      double num = toString().toAppString()!.toAppDouble();
      late NumberFormat formatter;
      if ((num % 1) == 0) {
        formatter = NumberFormat.decimalPatternDigits(
          locale: 'en_us',
          decimalDigits: 0,
        );
      } else {
        formatter = NumberFormat.decimalPatternDigits(
          locale: 'en_us',
          decimalDigits: 2,
        );
      }
      return formatter.format(num);
    } catch (_) {
      return toString().toAppString()!;
    }
  }
}
