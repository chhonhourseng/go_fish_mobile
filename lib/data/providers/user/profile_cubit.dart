/// profile_cubit
import 'package:app/export.dart';

typedef ProfileState = BaseBlocState<ProfileHiveBox>;

@injectable
class ProfileCubit extends BaseBlocCubit<ProfileHiveBox> {
  final UserInterface repository;

  ProfileCubit(this.repository);

  @override
  Future<BaseResponse<ProfileHiveBox>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (kDebugMode) {}
    final response = await repository.profile();
    if (kDebugMode) {}
    if (response.data != null) {
      app.userStorage.put(data: response.data!);
    }
    return response;
  }

  void pastFromStorage() {
    final v = app.userStorage.get();
    if (v != null) {
      emit(state.copyWith(
        data: v,
        stateStatus: AppStateStatus.success,
      ));
    }
  }
}
