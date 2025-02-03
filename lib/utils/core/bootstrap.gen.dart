part of 'bootstrap.dart';

void _registerHiveModelAdapters() {
  Hive.registerAdapter(ProfileHiveBoxAdapter());
  Hive.registerAdapter(TokenHiveboxAdapter());
}
