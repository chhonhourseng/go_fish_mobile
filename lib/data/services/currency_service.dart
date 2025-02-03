import 'package:app/export.dart';

////////////////// Interface

abstract class CurrencyInterface {
  Future<BaseResponse<CurrencyResponse>> get({required int page});
}

////////////////// Repository
@Injectable(as: CurrencyInterface)
class CurrencyRepository implements CurrencyInterface {
  const CurrencyRepository(this._service);

  final CurrencyService _service;

  Future<BaseResponse<CurrencyResponse>> get({required int page}) {
    return _service.get(page: page);
  }
}

////////////////// Service
@Injectable()
class CurrencyService implements CurrencyInterface {
  Future<BaseResponse<CurrencyResponse>> get({required int page}) {
    if (kDebugMode) {}
    return DioClient.getMethod<CurrencyResponse>(
      path: '/api/currencies',
      queryParameters: {
        'page': page,
        'limit': app.limit,
      },
    );
  }
}
