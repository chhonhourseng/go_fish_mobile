import 'package:app/export.dart';

typedef ChangeUserPhoneNumberState = BaseBlocState<EmptyResponse>;
@Injectable()
class ChangeUserPhoneNumberCubit extends BaseBlocCubit<EmptyResponse> {
  final UserInterface repository;

  ChangeUserPhoneNumberCubit(this.repository);

  @override
  Future<BaseResponse<EmptyResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is ChangeUserPhoneNumberRequest) {
      final response = await repository.changePhoneNumber(request: data);
      if (kDebugMode) {}
      return response;
    }
    throw const CustomException().toString();
  }
}