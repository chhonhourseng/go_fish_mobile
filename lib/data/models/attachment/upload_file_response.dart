/// attachment_response
import 'package:app/export.dart';
import 'package:annotations/annotations.dart';
part 'upload_file_response.g.dart';

@JsonAnnotation()
class UploadFileResponse {
  UploadFileResponse({
    required this.duration,
    required this.fileType,
    required this.filename,
    required this.height,
    required this.id,
    required this.originalName,
    required this.size,
    required this.type,
    required this.url,
    required this.width,
  });

  final int duration;
  final String fileType;
  final String filename;
  final int height;
  final int id;
  final String originalName;
  final int size;
  final String type;
  final String url;
  final int width;

  factory UploadFileResponse.fromJson(Map<String, dynamic> json) => _$UploadFileResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UploadFileResponseToJson(this);

}