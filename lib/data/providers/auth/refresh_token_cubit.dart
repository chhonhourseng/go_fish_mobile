
import 'package:app/export.dart';

typedef RefreshTokenState = BaseBlocState<TokenHivebox>;

@Injectable()
class RefreshTokenCubit extends BaseBlocCubit<TokenHivebox> {
  final AuthInterface repository;

  RefreshTokenCubit(this.repository);

  @override
  Future<BaseResponse<TokenHivebox>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (app.token != null) {
      final response = await repository.refreshToken(app.token!.refreshToken);
      if (kDebugMode) {}
      if (response.data != null) {
        await app.tokenStorage.put(data: response.data!);
      }
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
