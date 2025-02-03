import 'package:app/export.dart';

const fallbackLocale = Locale('zh', 'CN');

enum AppLocales {
  khmer(
    apiLanguageCode: 'km-km',
    languageCode: "km",
    countryCode: "KH",
    sub: "KH",
    name: "ភាសាខ្មែរ",
    image: AppAssets.defaultProfileImage,
    circleFlag: AppAssets.khmerImage,
  ),
  //zh-tw for traditional chinese
  chinese(
    apiLanguageCode: 'zh-cn',
    languageCode: "zh",
    countryCode: "CN",
    sub: "CN",
    name: "中文",
    image: AppAssets.defaultProfileImage,
    circleFlag: AppAssets.chineseImage,
  ),
  english(
    apiLanguageCode: 'en-us',
    languageCode: "en",
    countryCode: "US",
    name: "English",
    sub: "Eng",
    image: AppAssets.defaultProfileImage,
    circleFlag: AppAssets.englishImage,
  ),
  vietnamese(
    apiLanguageCode: 'vt-vn',
    languageCode: "vi",
    countryCode: "VN",
    sub: "VN",
    name: "Tiếng Việt",
    image: AppAssets.defaultProfileImage,
    circleFlag: AppAssets.vetnameImage,
  );

  final String apiLanguageCode;
  final String languageCode;
  final String countryCode;
  final String name;
  final String sub;
  final String image;
  final String circleFlag;

  const AppLocales({
    required this.apiLanguageCode,
    required this.languageCode,
    required this.countryCode,
    required this.name,
    required this.sub,
    required this.image,
    required this.circleFlag,
  });

  String get localeString => "${languageCode}_$countryCode";

  Locale get locale => Locale(languageCode, countryCode);

  bool equal(Locale locale) => languageCode == locale.languageCode;

  static AppLocales match(Locale locale) {
    for (AppLocales option in AppLocales.values) {
      if (option.languageCode == locale.languageCode) {
        return option;
      }
    }
    return app.DEFAULT_LOCALE;
  }

  static AppLocales matchLanguageCode(String v) {
    for (AppLocales option in AppLocales.values) {
      if (option.languageCode == v) {
        if (kDebugMode) {}
        return option;
      }
    }
    return app.DEFAULT_LOCALE;
  }
}
