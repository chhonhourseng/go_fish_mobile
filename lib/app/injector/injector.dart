import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:app/app/injector/injector.config.dart';
final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $init(getIt);