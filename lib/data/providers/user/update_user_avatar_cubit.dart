/// update_user_avatar_cubit
import 'package:app/export.dart';

typedef UpdateUserAvatarState = BaseBlocState<EmptyResponse>;
@Injectable()
class UpdateUserAvatarCubit extends BaseBlocCubit<EmptyResponse> {
  final UserInterface repository;

  UpdateUserAvatarCubit(this.repository);

  @override
  Future<BaseResponse<EmptyResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    final response = await repository.updateUserAvatar(profileId: id!);
    if (kDebugMode) {}
    app.context.read<ProfileCubit>().request();
    return response;
  }
}
