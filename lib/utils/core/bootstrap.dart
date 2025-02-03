import 'dart:async';
import 'dart:io';

import 'package:app/export.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart' as p;

part 'bootstrap.gen.dart';

class AppBlocObserver extends BlocObserver {
  const AppBlocObserver();

  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    //log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    //log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  FlutterError.onError = (details) {
    //log(details.exceptionAsString(), stackTrace: details.stack);
  };
  // Override HTTPS certificate warning
  HttpOverrides.global = MyHttpOverrides();

  //Bloc.observer = const AppBlocObserver();
  WidgetsFlutterBinding.ensureInitialized();
  //var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  configureDependencies();
  setOrientation();
  // WidgetsBinding.instance.addObserver(RequestAuthOnResume());

  // Starts showing splash and will call to remove() later
  // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  // Initial hive
  await _setUpHive();
  await DeviceInfoHelper.init();
  await AppPackageInfo.init();

  // Add cross-flavor configuration here
  runApp(await builder());
}

Future _setUpHive() async {
  var directory = await p.getApplicationDocumentsDirectory();
  await Hive.initFlutter(directory.path);

  _registerHiveModelAdapters();

  await _openHiveBoxSync();
}

void setOrientation() {
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
}

Future _openHiveBoxSync() async {
  for (var boxName in StorageBox.values) {
    await Hive.openBox(boxName.name);
  }
}
