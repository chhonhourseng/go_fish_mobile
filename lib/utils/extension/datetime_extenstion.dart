import 'package:intl/intl.dart';
import 'package:app/export.dart';

extension DatetimeExtenstion on DateTime {
  String toFormat({String? format}) {
    final dt = DateTime(this.year, this.month, this.day, this.hour, this.minute);
    final check = DateTime(dt.year, dt.month, dt.day);
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = DateTime(now.year, now.month, now.day - 1);
    if (check == today) {
      return T.today.r;
    } else if (check == yesterday) {
      return T.yesterday.r;
    }
    return dt.toFormatDateOfDay(format: format);
  }

  String toFormatSql() {
    // Format the DateTime object to ISO 8601 format
    String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(this);
    return formattedDate;
  }

  String toFormatDateOfDay({String? format}) {
    final locale = app.currentAppLocale;
    final dt = DateTime(this.year, this.month, this.day, this.hour, this.minute);
    final formats = DateFormat(format ?? "d, MMM y", locale.languageCode);
    return formats.format(dt);
  }
}
