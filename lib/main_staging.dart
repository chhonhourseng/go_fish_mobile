import 'package:app/export.dart';

void main() {
  FlavorConfig(
    environment: FlavorEnvironment.STAGING,
    name: AppEnv.STAGING_LABEL_NAME,
    variables: AppEnv.stagingEnvironment,
  );
  bootstrap(() => const App());
}
