import 'package:flutter/foundation.dart';
import 'package:app/export.dart';

class StorageService {
  static const defaultBoxName = StorageBox.generalBox;

  ValueListenable<Box> getListenable(String? key, {StorageBox boxName = defaultBoxName}) {
    if (key == null) {
      return Hive.box(boxName.name).listenable();
    }
    return Hive.box(boxName.name).listenable(keys: [key]);
  }

  Future add<T>({
    required T data,
    required StorageBox boxName,
  }) async {
    final box = Hive.box(boxName.name);
    await box.add(data);
  }

  List<T> list<T>({
    required StorageBox boxName,
  }) {
    final box = Hive.box(boxName.name);
    return List<T>.from(box.values);
  }

  remove<T>({
    required T data,
    required StorageBox boxName,
  }) async {
    final box = Hive.box(boxName.name);
    return box.deleteAt(
      list<T>(boxName: boxName).indexOf(data),
    );
  }

  Future put<T>({required String key, required T data, StorageBox boxName = defaultBoxName}) async {
    final box = Hive.box(boxName.name);
    await box.put(key, data);
  }

  T get<T>({required String key, StorageBox boxName = defaultBoxName, dynamic defaultValue}) {
    final box = Hive.box(boxName.name);
    return box.get(
      key,
      defaultValue: defaultValue,
    ) as T;
  }

  Future delete({required String key, StorageBox boxName = defaultBoxName, dynamic defaultValue}) async {
    final box = Hive.box(boxName.name);
    await box.delete(key);
  }
}
