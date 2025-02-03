import 'dart:math';

import 'package:app/export.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:uuid/uuid.dart';

class AppGlobal {
  NavigationHelper get navigate => NavigationHelper();

  BuildContext get context => globalKey.currentState!.context;

  SnackBarHelper get snackBar => SnackBarHelper();

  String DEFAULT_COUNTRY_CODE = '+855';

  String DEFAULT_DATETIME_FORMAT = 'yyyy-MM-ddTHH:mm:ssZ';

  String DEFAULT_DATE_FORMAT = 'yyyy-MM-dd';

  AppLocales DEFAULT_LOCALE = AppLocales.english;

  DateTime now = DateTime.now();

  ScrollPhysics get scrollPhysics => const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics());

  void focusNew(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  bool get isLogin => tokenStorage.get() != null;

  UserStorage get userStorage => UserStorage();

  TokenStorage get tokenStorage => TokenStorage();

  StorageService get storage => StorageService();

  TokenHivebox? get token => tokenStorage.get();

  ProfileHiveBox? get user => userStorage.get();

  bool get isUser => app.token?.getIsUser ?? true;

  DeviceInfoModel? device = DeviceInfoHelper.instance;

  FormValidationHelper validation = FormValidationHelper();

  final int limit = 20;

  Locale get currentLocale => app.context.read<LanguageCubit>().state.localeData?.locale ?? app.DEFAULT_LOCALE.locale;

  AppLocales get currentAppLocale {
    final v = app.storage.get<String>(key: LANGUAGE, defaultValue: '');
    return v.isNotEmpty ? AppLocales.matchLanguageCode(v) : DEFAULT_LOCALE;
  }

  void restart(BuildContext context) {
    HomePage.scaffoldKey = GlobalKey<ScaffoldState>();
    context.navigate.pushNamedAndRemoveUntil(HomePage.route);
  }

  var _uuid = const Uuid();

  String get uuid => _uuid.v1();

  Future<File> xFileToFile(XFile xFile) async {
    final bytes = await File(xFile.path).readAsBytes();
    final tempDir = await getTemporaryDirectory();
    final tempPath = '${tempDir.path}/${DateTime.now().millisecondsSinceEpoch}.png';
    await File(tempPath).writeAsBytes(bytes);
    return File(tempPath);
  }

  String get getConfigBaseUrl {
    final configBaseUrl = app.storage.get<String>(key: CONFIG_BASE_URL, defaultValue: '');
    return configBaseUrl.isEmpty ? AppEnv.baseUrl : configBaseUrl;
  }

  Future<void> logout() async {
    await userStorage.delete();
    await tokenStorage.delete();
    app.context.read<ProfileCubit>().reset();
  }

  Future initData(BuildContext context) async {
    if (app.isLogin) {
      context.read<ProfileCubit>().pastFromStorage();
    }
  }

  Future refreshProfile() async {
    if (isLogin) {
      if (token?.getIsUser ?? true) {
        app.context.read<ProfileCubit>().request();
      } else {
        //app.context.read<StoreProfileCubit>().request();
      }
    }
  }

  Color iconColor(BuildContext context) {
    return Theme.of(context).appBarTheme.iconTheme!.color!;
  }

  TextStyle? inputTextStyle(BuildContext context) {
    return Theme.of(context).inputDecorationTheme.hintStyle;
  }

  Color backgroundDialogColor(BuildContext context) {
    try {
      return Theme.of(context).dialogBackgroundColor;
    } catch (e) {
      return Colors.white;
    }
  }

  TextStyle modalBottomSheetTextStyle(BuildContext context) {
    return context.textTheme.headlineMedium!.copyWith(fontSize: 18, fontWeight: FontWeight.w700);
  }

  String extension(String value) {
    String extension = p.extension(value);
    return extension.replaceFirst('.', '');
  }

  int randomInt() {
    var random = Random();
    int min = 1;
    int max = 20;
    int randomIntInRange = min + random.nextInt(max - min + 1);
    return randomIntInRange;
  }

  final screenPaddingX = const EdgeInsets.symmetric(horizontal: 15);
  final screenPaddingY = const EdgeInsets.symmetric(vertical: 20);
  final screenPadding = const EdgeInsets.symmetric(vertical: 20, horizontal: 15);

  final String sampleImage =
      'https://w7.pngwing.com/pngs/1001/506/png-transparent-slices-of-oranges-orange-juice-flavor-fruit-nutritious-orange-natural-foods-food-orange.png';

  String convertDeviceLoginTime(String dateString) {
    final locale = currentAppLocale;
    DateTime dateTime = DateTime.parse(dateString).toLocal();
    DateTime cambodiaDateTime = dateTime.add(const Duration(hours: 0)); // Adding 7 hours to convert to Cambodia time
    DateFormat formatter = DateFormat('MMMM dd, yyyy hh:mm a', locale.languageCode);
    String formattedDate = formatter.format(cambodiaDateTime);
    return formattedDate;
  }

  dynamic formatTimeOfDay(TimeOfDay tod, {returnObject = false, return24FormatTime = false}) {
    final now = DateTime.now();
    final dt = DateTime(now.year, now.month, now.day, tod.hour, tod.minute);
    if (returnObject) {
      return dt;
    } else if (return24FormatTime) {
      final format = DateFormat.Hm();
      return format.format(dt);
    }
    final format = DateFormat.jm(); //"6:00 AM"
    return format.format(dt);
  }

  void showUpdateApp() => AppDialog(
        child: Column(
          children: [
            Text(T.updateApp.r, style: context.textTheme.headlineLarge),
            Text(T.aNewVersionIsAvailable.r, style: context.textTheme.bodySmall),
            Text(T.wouldYouLikeToUpdateItNow.r, style: context.textTheme.bodySmall),
            15.sh(),
            Row(
              children: [
                Expanded(
                  child: FilledButton(
                    onPressed: () {},
                    child: Text(T.updateNow.r),
                  ),
                ),
                15.sw(),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => context.navigate.pop(),
                    child: Text(T.later.r),
                  ),
                ),
              ],
            ),
          ].separator((i) => 10.sh()),
        ),
      ).show(context);
}
