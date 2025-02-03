import 'package:app/export.dart';

class AppRoutes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case HomePage.route:
        return _buildRoute(
            MultiBlocProvider(
              providers: [
                BlocProvider<VersionCubit>(create: (context) => getIt<VersionCubit>()),
                 BlocProvider<GetLanguageCubit>(create: (context) => getIt<GetLanguageCubit>()),
              ],
              child: const HomePage(),
            ),
            settings);
      default:
        return _buildRoute(
          Scaffold(
            body: Center(
              child: Text(
                'No route defined for ${settings.name}',
              ),
            ),
          ),
          settings,
        );
    }
  }

  static _buildRoute(Widget widget, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => widget, settings: settings);
  }
}
