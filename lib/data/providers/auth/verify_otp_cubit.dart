import 'package:app/export.dart';

typedef VerifyOtpState = BaseBlocState<TokenHivebox>;

@Injectable()
class VerifyOtpCubit extends BaseBlocCubit<TokenHivebox> {
  final AuthInterface repository;

  VerifyOtpCubit(this.repository);

  @override
  Future<BaseResponse<TokenHivebox>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is VerifyOtpRequest) {
      final response = await repository.verifyOtp(data);
      if (kDebugMode) {}
      if (response.data != null) {
        await app.tokenStorage.put(data: response.data!);
        app.context.read<ProfileCubit>().request();
      }
      return response;
    } else {
      throw const CustomException().toString();
    }
  }
}
