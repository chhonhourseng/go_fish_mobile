import 'package:app/export.dart';

typedef VersionState = BaseBlocState<VersionResponse>;

@Injectable()
class VersionCubit extends BaseBlocCubit<VersionResponse> {
  VersionCubit(this.repository);

  final VersionInterface repository;

  @override
  Future<BaseResponse<VersionResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    final response = await repository.get();
    if (kDebugMode) {}
    return response;
  }
}
