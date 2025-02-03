import 'package:app/export.dart';

typedef CurrencyState = BaseListBlocState<CurrencyResponse>;

@Injectable()
class CurrencyCubit extends BaseListBlocCubit<CurrencyResponse> {
  final CurrencyInterface repository;

  CurrencyCubit(this.repository);

  @override
  Future<BaseResponse<CurrencyResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    final response = await repository.get(page: 1);
    if (kDebugMode) {}
    return response;
  }
}
