import 'package:app/export.dart';
import 'package:intl/intl.dart';

extension StringExtension on String {
  String toDateFormat({bool isTime = true, String? format}) {
    String sr = toString().toAppString()!;
    try {
      final dt = isTime ? sr.toDateTime() : sr.toDate();
      return dt.toFormat(format: format);
    } catch (_) {
      return sr;
    }
  }

  DateTime toDateTime() {
    return toDateObject();
  }

  DateTime toDate() {
    return toDateObject(format: app.DEFAULT_DATE_FORMAT);
  }

  DateTime toDateObject({String? format}) {
    String v = toString().toAppString()!;
    DateTime dt = DateFormat(format ?? app.DEFAULT_DATETIME_FORMAT).parse(v, true).toLocal();
    return dt;
  }
}
