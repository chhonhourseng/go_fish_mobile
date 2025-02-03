import 'package:app/export.dart';

////////////////// Interface
abstract class AuthInterface {
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request);

  Future<BaseResponse<TokenHivebox>> verifyOtp(VerifyOtpRequest request);

  Future<BaseResponse<RegisterResponse>> login(RegisterRequest request);

  Future<BaseResponse<TokenHivebox>> refreshToken(String refreshToken);
}

////////////////// Repository
@Injectable(as: AuthInterface)
class AuthRepository implements AuthInterface {
  const AuthRepository(this._service);

  final AuthService _service;

  @override
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request) {
    return _service.register(request);
  }

  @override
  Future<BaseResponse<TokenHivebox>> verifyOtp(VerifyOtpRequest request) {
    return _service.verifyOtp(request);
  }

  @override
  Future<BaseResponse<RegisterResponse>> login(RegisterRequest request) {
    return _service.login(request);
  }

  @override
  Future<BaseResponse<TokenHivebox>> refreshToken(String refreshToken) {
    return _service.refreshToken(refreshToken);
  }
}

////////////////// Service
@Injectable()
class AuthService implements AuthInterface {
  @override
  Future<BaseResponse<RegisterResponse>> register(RegisterRequest request) {
    return DioClient.postMethod<RegisterResponse>(
      path: '/api/auth/register',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<TokenHivebox>> verifyOtp(VerifyOtpRequest request) {
    return DioClient.postMethod<TokenHivebox>(
      path: '/api/auth/verify-otp',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<RegisterResponse>> login(RegisterRequest request) {
    return DioClient.postMethod<RegisterResponse>(
      path: '/api/auth/signup-login',
      request: request.toJson(),
    );
  }

  @override
  Future<BaseResponse<TokenHivebox>> refreshToken(String refreshToken) {
    return DioClient.postMethod<TokenHivebox>(
      path: '/api/auth/refresh-token',
      request: {'refresh_token': refreshToken},
    );
  }
}
