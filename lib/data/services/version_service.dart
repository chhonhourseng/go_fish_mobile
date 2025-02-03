import 'dart:io';

import 'package:app/export.dart';

////////////////// Interface

abstract class VersionInterface {
  Future<BaseResponse<VersionResponse>> get();
}

////////////////// Repository
@Injectable(as: VersionInterface)
class VersionRepository implements VersionInterface {
  const VersionRepository(this._service);

  final VersionService _service;

  Future<BaseResponse<VersionResponse>> get() {
    return _service.get();
  }
}

////////////////// Service
@Injectable()
class VersionService implements VersionInterface {
  Future<BaseResponse<VersionResponse>> get() {
    return DioClient.getMethod<VersionResponse>(
      path: '/api/versions',
      queryParameters: {
        'platform': Platform.isIOS ? 'ios' : 'android',
      },
    );
  }
}
