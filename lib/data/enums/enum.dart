import 'package:app/export.dart';

enum AppStateStatus {
  none,
  initial,
  loading,
  failure,
  empty,
  success,
  noInternet,
  connected,
  disConnected,
}

enum AppHttpStatus { error, tokenExpired, refreshTokenExpired, noUrl, fetchDataError, internalServerError, timeout }

enum FormStyle { style1, style2, style3 }

enum AppLanguage { English, Chines, Vietnam, Khmer }

enum TypeOfImageSize { smallest, smallx2, small, medium, big, biggest, none }

enum GenderType {
  male(i18n: T.male),
  female(i18n: T.female);

  const GenderType({
    required this.i18n,
  });

  final I18n i18n;
}