part of 'language_cubit.dart';

class LanguageState {
  final AppLocales? localeData;

  const LanguageState({this.localeData});

  LanguageState copyWith({AppLocales? localeData}) {
    return LanguageState(
      localeData: localeData ?? localeData,
    );
  }
}
