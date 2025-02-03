import 'package:app/export.dart';

void main() {
  FlavorConfig(
    environment: FlavorEnvironment.PROD,
    name: AppEnv.PRODUCTION_LABEL_NAME,
    variables: AppEnv.productionEnvironment,
  );
  bootstrap(() => const App());
}
