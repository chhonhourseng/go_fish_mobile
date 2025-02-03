import 'package:app/export.dart';

////////////////// Interface

abstract class LanguageInterface {
  Future<BaseResponse<LanguageResponse>> get();
}

////////////////// Repository
@Injectable(as: LanguageInterface)
class LanguageRepository implements LanguageInterface {
  const LanguageRepository(this._service);
  
  final LanguageService _service;

  Future<BaseResponse<LanguageResponse>> get(){
    return _service.get();
  }
}

////////////////// Service
@Injectable()
class LanguageService implements LanguageInterface {
  Future<BaseResponse<LanguageResponse>> get(){
    return DioClient.getMethod<LanguageResponse>(
      path: '/api/languages',
    );
  }
}
