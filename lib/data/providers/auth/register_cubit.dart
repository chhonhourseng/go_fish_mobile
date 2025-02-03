import 'package:app/export.dart';

typedef RegisterState = BaseBlocState<RegisterResponse>;

@Injectable()
class RegisterCubit extends BaseBlocCubit<RegisterResponse> {
  final AuthInterface repository;

  RegisterCubit(this.repository);

  @override
  Future<BaseResponse<RegisterResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is RegisterRequest) {
      final response = await repository.login(data);
      if (kDebugMode) {}
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
