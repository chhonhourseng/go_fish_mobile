import 'package:app/export.dart';

class AppBlocsProvider extends StatelessWidget {
  final Widget child;

  const AppBlocsProvider({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<RegisterCubit>(create: (context) => getIt<RegisterCubit>()),
        BlocProvider<VerifyOtpCubit>(create: (context) => getIt<VerifyOtpCubit>()),
        BlocProvider<ProfileCubit>(create: (context) => getIt<ProfileCubit>()),
        BlocProvider<RefreshTokenCubit>(create: (context) => getIt<RefreshTokenCubit>()),
        BlocProvider<LanguageCubit>(create: (context) => getIt<LanguageCubit>()),
        BlocProvider<CurrencyCubit>(create: (BuildContext context) => getIt<CurrencyCubit>()),
        BlocProvider<AppSocketCubit>(create: (BuildContext context) => getIt<AppSocketCubit>()),
        //BlocProvider<ConfigCubit>(create: (context) => ConfigCubit(DependencyHelper.repository)),
      ],
      child: child,
    );
  }
}
