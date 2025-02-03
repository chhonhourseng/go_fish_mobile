/// login_cubit
import 'package:app/export.dart';

typedef LoginState = BaseBlocState<RegisterResponse>;

@Injectable()
class LoginCubit extends BaseBlocCubit<RegisterResponse> {
  final AuthInterface repository;

  LoginCubit(this.repository);

  @override
  Future<BaseResponse<RegisterResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is RegisterRequest) {
      final response = await repository.login(data);
      if (kDebugMode) {}
      return response;
    }
    throw const CustomException().toString();
  }
}
