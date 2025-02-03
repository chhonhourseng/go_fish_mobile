
import 'package:app/export.dart';

////////////////// Interface

abstract class AttachmentInterface {
  Future<BaseResponse<UploadFileResponse>> uploadFile({required File file, void Function(int, int)? onSendProgress});

  Future<BaseResponse<UploadFileResponse>> uploadFiles({required List<File> files, void Function(int, int)? onSendProgress});
}

////////////////// Repository
@Injectable(as: AttachmentInterface)
class AttachmentRepository implements AttachmentInterface {
  const AttachmentRepository(this._service);

  final AttachmentService _service;

  @override
  Future<BaseResponse<UploadFileResponse>> uploadFile({required File file, void Function(int, int)? onSendProgress}) {
    return _service.uploadFile(file: file, onSendProgress: onSendProgress);
  }

  @override
  Future<BaseResponse<UploadFileResponse>> uploadFiles({required List<File> files, void Function(int, int)? onSendProgress}) {
    return _service.uploadFiles(files: files, onSendProgress: onSendProgress);
  }
}

////////////////// Service
@Injectable()
class AttachmentService implements AttachmentInterface {
  @override
  Future<BaseResponse<UploadFileResponse>> uploadFile({required File file, void Function(int, int)? onSendProgress}) {
    return DioClient.postMethod<UploadFileResponse>(
      path: '/api/attachment/upload-image',
      onSendProgress: onSendProgress,
      file: {'file': file},
    );
  }

  @override
  Future<BaseResponse<UploadFileResponse>> uploadFiles({required List<File> files, void Function(int, int)? onSendProgress}) {
    return DioClient.postMethod<UploadFileResponse>(
      path: '/api/attachment/upload-image/multiple',
      onSendProgress: onSendProgress,
      files: {'files': files},
    );
  }
}
