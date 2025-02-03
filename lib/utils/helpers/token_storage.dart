import 'dart:developer';

import 'package:app/export.dart';

class TokenStorage extends StorageServiceInterface<TokenHivebox> {
  @override
  String get defaultBoxName => StorageBox.tokenBox.name;

  @override
  Future put({required TokenHivebox data}) {
    logSuccess('${data.accessToken}', name: 'Token');
    return super.put(data: data);
  }
}
