import 'package:app/export.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  static final RouteObserver<Route<dynamic>> routeObserver = RouteObserver<Route<dynamic>>();

  @override
  Widget build(BuildContext context) {
    return AppBlocsProvider(
      child: Builder(builder: (context) {
        app.initData(context);
        ContextHelper.initialize(context: context);
        context.read<LanguageCubit>().init();
        return BlocBuilder<ProfileCubit, ProfileState>(
          builder: (_, __) {
            return BlocBuilder<LanguageCubit, LanguageState>(
              builder: (_, language) {
                return MaterialApp(
                  key: ObjectKey(language.localeData?.locale),
                  localizationsDelegates: const [
                    GlobalMaterialLocalizations.delegate,
                    GlobalWidgetsLocalizations.delegate,
                    GlobalCupertinoLocalizations.delegate,
                  ],
                  theme: customLightTheme,
                  darkTheme: customDarkTheme,
                  themeMode: ThemeMode.light,
                  locale: language.localeData?.locale ?? app.DEFAULT_LOCALE.locale,
                  navigatorKey: globalKey,
                  supportedLocales: AppLocales.values.map((e) => e.locale),
                  onGenerateRoute: AppRoutes.generateRoute,
                  initialRoute: HomePage.route,
                );
              },
            );
          },
        );
      }),
    );
  }
}
