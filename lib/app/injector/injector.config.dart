// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../data/providers/attachment/upload_file_cubit.dart' as _i227;
import '../../data/providers/attachment/upload_files_cubit.dart' as _i627;
import '../../data/providers/auth/login_cubit.dart' as _i865;
import '../../data/providers/auth/refresh_token_cubit.dart' as _i125;
import '../../data/providers/auth/register_cubit.dart' as _i36;
import '../../data/providers/auth/verify_otp_cubit.dart' as _i406;
import '../../data/providers/currency/currency_cubit.dart' as _i461;
import '../../data/providers/language/get_language_cubit.dart' as _i981;
import '../../data/providers/setting/language/language_cubit.dart' as _i141;
import '../../data/providers/socket/app_socket_cubit.dart' as _i849;
import '../../data/providers/user/change_user_phone_number_cubit.dart' as _i49;
import '../../data/providers/user/profile_cubit.dart' as _i566;
import '../../data/providers/user/update_user_avatar_cubit.dart' as _i567;
import '../../data/providers/user/update_user_info_cubit.dart' as _i827;
import '../../data/providers/version/version_cubit.dart' as _i685;
import '../../data/services/attachment_service.dart' as _i84;
import '../../data/services/auth_service.dart' as _i117;
import '../../data/services/currency_service.dart' as _i109;
import '../../data/services/language_service.dart' as _i1014;
import '../../data/services/user_service.dart' as _i571;
import '../../data/services/version_service.dart' as _i716;
import '../../data/sockets/app_socket.dart' as _i910;
import '../../export.dart' as _i616;

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt $init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i910.AppSocket>(() => _i910.AppSocket());
  gh.factory<_i141.LanguageCubit>(() => _i141.LanguageCubit());
  gh.factory<_i716.VersionService>(() => _i716.VersionService());
  gh.factory<_i117.AuthService>(() => _i117.AuthService());
  gh.factory<_i84.AttachmentService>(() => _i84.AttachmentService());
  gh.factory<_i109.CurrencyService>(() => _i109.CurrencyService());
  gh.factory<_i571.UserService>(() => _i571.UserService());
  gh.factory<_i1014.LanguageService>(() => _i1014.LanguageService());
  gh.factory<_i84.AttachmentInterface>(
      () => _i84.AttachmentRepository(gh<_i84.AttachmentService>()));
  gh.factory<_i571.UserInterface>(
      () => _i571.UserRepository(gh<_i571.UserService>()));
  gh.factory<_i1014.LanguageInterface>(
      () => _i1014.LanguageRepository(gh<_i1014.LanguageService>()));
  gh.factory<_i567.UpdateUserAvatarCubit>(
      () => _i567.UpdateUserAvatarCubit(gh<_i616.UserInterface>()));
  gh.factory<_i49.ChangeUserPhoneNumberCubit>(
      () => _i49.ChangeUserPhoneNumberCubit(gh<_i616.UserInterface>()));
  gh.factory<_i827.UpdateUserInfoCubit>(
      () => _i827.UpdateUserInfoCubit(gh<_i616.UserInterface>()));
  gh.factory<_i566.ProfileCubit>(
      () => _i566.ProfileCubit(gh<_i616.UserInterface>()));
  gh.factory<_i117.AuthInterface>(
      () => _i117.AuthRepository(gh<_i117.AuthService>()));
  gh.factory<_i981.GetLanguageCubit>(
      () => _i981.GetLanguageCubit(gh<_i616.LanguageInterface>()));
  gh.factory<_i109.CurrencyInterface>(
      () => _i109.CurrencyRepository(gh<_i109.CurrencyService>()));
  gh.factory<_i849.AppSocketCubit>(
      () => _i849.AppSocketCubit(gh<_i616.AppSocket>()));
  gh.factory<_i227.UploadFileCubit>(
      () => _i227.UploadFileCubit(gh<_i616.AttachmentInterface>()));
  gh.factory<_i627.UploadFilesCubit>(
      () => _i627.UploadFilesCubit(gh<_i616.AttachmentInterface>()));
  gh.factory<_i716.VersionInterface>(
      () => _i716.VersionRepository(gh<_i716.VersionService>()));
  gh.factory<_i865.LoginCubit>(
      () => _i865.LoginCubit(gh<_i616.AuthInterface>()));
  gh.factory<_i125.RefreshTokenCubit>(
      () => _i125.RefreshTokenCubit(gh<_i616.AuthInterface>()));
  gh.factory<_i406.VerifyOtpCubit>(
      () => _i406.VerifyOtpCubit(gh<_i616.AuthInterface>()));
  gh.factory<_i36.RegisterCubit>(
      () => _i36.RegisterCubit(gh<_i616.AuthInterface>()));
  gh.factory<_i461.CurrencyCubit>(
      () => _i461.CurrencyCubit(gh<_i616.CurrencyInterface>()));
  gh.factory<_i685.VersionCubit>(
      () => _i685.VersionCubit(gh<_i616.VersionInterface>()));
  return getIt;
}
