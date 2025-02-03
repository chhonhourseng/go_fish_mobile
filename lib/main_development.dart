import 'package:app/export.dart';

void main() {
  FlavorConfig(
    environment: FlavorEnvironment.DEV,
    name: AppEnv.DEVELOPMENT_LABEL_NAME,
    variables: AppEnv.developmentEnvironment,
  );
  bootstrap(() => const App());
}
