
import 'package:app/export.dart';

typedef UploadFileState = BaseBlocState<UploadFileResponse>;
@Injectable()
class UploadFileCubit extends BaseBlocCubit<UploadFileResponse> {
  final AttachmentInterface repository;

  UploadFileCubit(this.repository);

  double? progress;
  int? idAttachment;

  @override
  Future<BaseResponse<UploadFileResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is File) {
      idAttachment = null;
      final response = await repository.uploadFile(
          file: data,
          onSendProgress: (current, total) {
            progress = current / total;
            emit(state.copyWith());
          });
      idAttachment = response.data?.id;
      if (kDebugMode) {}
      return response;
    }
    idAttachment = null;
    throw const CustomException().toString();
  }

  @override
  void reset() {
    idAttachment = null;
    progress = null;
    super.reset();
  }
}
