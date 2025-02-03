import 'package:app/export.dart';

class UserStorage extends StorageServiceInterface<ProfileHiveBox> {
  @override
  String get defaultBoxName => StorageBox.userBox.name;

  @override
  Future put({required ProfileHiveBox data}) {
    return super.put(data: data);
  }

  @override
  ProfileHiveBox? get({defaultValue}) {
    final v = super.get(defaultValue: defaultValue);
    return v;
  }
}
