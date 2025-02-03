/// upload_files_cubit
import 'package:app/export.dart';

typedef UploadFilesState = BaseBlocState<UploadFileResponse>;

@Injectable()
class UploadFilesCubit extends BaseBlocCubit<UploadFileResponse> {
  final AttachmentInterface repository;

  UploadFilesCubit(this.repository);

  Map<String, UploadFilesProgress> progress = {};

  @override
  Future<BaseResponse<UploadFileResponse>> responseData([String? id, data, subData, bool isNetwork = true]) async {
    if (data is List<File>) {
      late BaseResponse<UploadFileResponse> response;
      for (var v in data) {
        if (progress.containsKey(v.path)) {
          if (progress[v.path]!.stateStatus == AppStateStatus.success) {
            if (kDebugMode) {}
            continue;
          }
        }
        progress[v.path] = UploadFilesProgress();
        try {
          response = await repository.uploadFile(
              file: v,
              onSendProgress: (current, total) {
                progress[v.path] = UploadFilesProgress(progress: current / total, stateStatus: AppStateStatus.loading);
                emit(state.copyWith());
              });
          if (kDebugMode) {}
          progress[v.path] = progress[v.path]!.copyWith(
            stateStatus: AppStateStatus.success,
            idAttachment: response.data!.id,
          );
          emit(state.copyWith());
        } catch (_) {
          if (kDebugMode) {}
          progress[v.path] = UploadFilesProgress(
            stateStatus: AppStateStatus.failure,
          );
          emit(state.copyWith());
        }
      }
      return response;
    }
    throw const CustomException().toString();
  }

  @override
  void reset() {
    progress = {};
    super.reset();
  }

  void remove(String key) {
    if (progress.isNotEmpty) {
      progress.remove(key);
    }
  }
}

class UploadFilesProgress {
  final double? progress;
  final int? idAttachment;
  final AppStateStatus stateStatus;

  UploadFilesProgress({this.progress, this.idAttachment, this.stateStatus = AppStateStatus.initial});

  UploadFilesProgress copyWith({
    double? progress,
    int? idAttachment,
    AppStateStatus? stateStatus,
  }) {
    return UploadFilesProgress(
      progress: progress ?? this.progress,
      idAttachment: idAttachment ?? this.idAttachment,
      stateStatus: stateStatus ?? this.stateStatus,
    );
  }
}
