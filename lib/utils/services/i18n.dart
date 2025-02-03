import 'package:app/export.dart';

class I18n {
  final String en;
  final String? zh;
  final String? km;
  final String? vi;

  const I18n({
    required this.en,
    this.zh,
    this.km,
    this.vi,
  });

  String get r {
    final currentLocale = app.currentLocale;
    if (currentLocale.languageCode == 'zh') {
      return zh ?? en;
    } else if (currentLocale.languageCode == 'km') {
      return km ?? en;
    } else if (currentLocale.languageCode == 'vi') {
      return vi ?? en;
    } else {
      return en;
    }
  }

  @override
  String toString() {
    return r;
  }

  String arg(List<dynamic> args) {
    var result = r;
    for (var arg in args) {
      result = result.replaceFirst('{}', arg.toString());
    }
    return result;
  }
}
