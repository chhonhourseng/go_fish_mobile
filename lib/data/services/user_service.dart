/// user_service
import 'package:app/export.dart';

////////////////// Interface

abstract class UserInterface {
  Future<BaseResponse<ProfileHiveBox>> profile({String? id});

  Future<BaseResponse<EmptyResponse>> updateUserAvatar({required String profileId});

  Future<BaseResponse<EmptyResponse>> updateUserInfo({required UpdateUserInfoRequest request});

  Future<BaseResponse<EmptyResponse>> changePhoneNumber({required ChangeUserPhoneNumberRequest request});

  Future<BaseResponse<TokenResponse>> quickSwitchProfile({required int? id});
}

////////////////// Repository

@Injectable(as: UserInterface)
class UserRepository implements UserInterface {
  const UserRepository(this._service);

  final UserService _service;

  @override
  Future<BaseResponse<ProfileHiveBox>> profile({String? id}) {
    return _service.profile(id: id);
  }

  @override
  Future<BaseResponse<EmptyResponse>> updateUserAvatar({required String profileId}) {
    return _service.updateUserAvatar(profileId: profileId);
  }

  @override
  Future<BaseResponse<EmptyResponse>> updateUserInfo({required UpdateUserInfoRequest request}) {
    return _service.updateUserInfo(request: request);
  }

  @override
  Future<BaseResponse<EmptyResponse>> changePhoneNumber({required ChangeUserPhoneNumberRequest request}) {
    return _service.changePhoneNumber(request: request);
  }

  @override
  Future<BaseResponse<TokenResponse>> quickSwitchProfile({required int? id}) {
    return _service.quickSwitchProfile(id: id);
  }
}

////////////////// Service
@Injectable()
class UserService implements UserInterface {
  @override
  Future<BaseResponse<ProfileHiveBox>> profile({String? id}) {
    return DioClient.getMethod<ProfileHiveBox>(
        path: '/api/user/profile',
        queryParameters: {if (id != null) 'id': id},
        onResponse: (v) {
          if (kDebugMode) {}
        });
  }

  @override
  Future<BaseResponse<EmptyResponse>> updateUserAvatar({required String profileId}) {
    return DioClient.putMethod<EmptyResponse>(
      path: '/api/user/profile',
      request: {
        'profile_id': profileId.toAppInt(),
      },
    );
  }

  @override
  Future<BaseResponse<EmptyResponse>> updateUserInfo({required UpdateUserInfoRequest request}) {
    return DioClient.putMethod<EmptyResponse>(
      path: '/api/user/info',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<EmptyResponse>> changePhoneNumber({required ChangeUserPhoneNumberRequest request}) {
    return DioClient.postMethod<EmptyResponse>(
      path: '/api',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<TokenResponse>> quickSwitchProfile({required int? id}) {
    return DioClient.postMethod<TokenResponse>(
      path: '/api/store/switch/$id',
      request: app.device?.toJson(),
    );
  }
}
