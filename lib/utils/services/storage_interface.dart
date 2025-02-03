import 'package:app/export.dart';

abstract class StorageServiceInterface<K> {
  StorageServiceInterface();

  String get defaultBoxName;

/*  Future add({
    required K data,
  }) async {
    final box = Hive.box(defaultBoxName);
    await box.add(json.decode(data.toString()));
  }*/

  Future put({required K data}) async {
    final box = Hive.box(defaultBoxName);
    await box.put(defaultBoxName, data);
  }

  K? get({dynamic defaultValue}) {
    try {
      final box = Hive.box(defaultBoxName);
      return box.get(
        defaultBoxName,
        defaultValue: defaultValue,
      );
    } catch (_) {
      if (kDebugMode) {}
      return defaultValue;
    }
  }

  Future delete() async {
    final box = Hive.box(defaultBoxName);
    await box.delete(defaultBoxName);
  }
}
