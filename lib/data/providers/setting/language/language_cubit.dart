import 'package:app/export.dart';
part 'language_state.gen.dart';

@Injectable()
class LanguageCubit extends Cubit<LanguageState> {
  LanguageCubit() : super(const LanguageState());

  void init() {
    if (state.localeData != null) return;
    final v = app.storage.get<String>(key: LANGUAGE, defaultValue: '');
    final locale = v.isEmpty ? app.DEFAULT_LOCALE : AppLocales.matchLanguageCode(v);
    _changeLocale(locale);
  }

  void change(AppLocales v) {
    if (kDebugMode) {}
    app.storage.put(key: LANGUAGE, data: v.languageCode);
    _changeLocale(v);
  }

  void _changeLocale(AppLocales v) {
    emit(state.copyWith(
      localeData: v,
    ));
  }
}
