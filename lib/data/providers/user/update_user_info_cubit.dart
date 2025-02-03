import 'package:app/export.dart';

typedef UpdateUserInfoState = BaseBlocState<EmptyResponse>;
@Injectable()
class UpdateUserInfoCubit extends BaseBlocCubit<EmptyResponse> {
  final UserInterface repository;

  UpdateUserInfoCubit(this.repository);

  @override
  Future<BaseResponse<EmptyResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is UpdateUserInfoRequest) {
      final response = await repository.updateUserInfo(request: data);
      if (kDebugMode) {}
      app.context.read<ProfileCubit>().request();
      return response;
    }
    throw const CustomException().toString();
  }
}
