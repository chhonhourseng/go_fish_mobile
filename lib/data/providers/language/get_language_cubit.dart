import 'package:app/export.dart';

typedef GetLanguageState = BaseListBlocState<LanguageResponse>;

@Injectable()
class GetLanguageCubit extends BaseListBlocCubit<LanguageResponse> {
  GetLanguageCubit(this.repository);

  final LanguageInterface repository;

  @override
  Future<BaseResponse<LanguageResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    final response = await repository.get();
    if (kDebugMode) {}
    return response;
  }
}
