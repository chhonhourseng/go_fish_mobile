// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_file_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
UploadFileResponse _$UploadFileResponseFromJson(Map<String, dynamic> json) =>
    UploadFileResponse(
      duration: json['duration'].toString().toAppInt(),
      fileType: json['file_type'].toString().toAppString()!,
      filename: json['filename'].toString().toAppString()!,
      height: json['height'].toString().toAppInt(),
      id: json['id'].toString().toAppInt(),
      originalName: json['original_name'].toString().toAppString()!,
      size: json['size'].toString().toAppInt(),
      type: json['type'].toString().toAppString()!,
      url: json['url'].toString().toAppString()!,
      width: json['width'].toString().toAppInt(),
    );

// To Json Method
Map<String, dynamic> _$UploadFileResponseToJson(UploadFileResponse instance) =>
    <String, dynamic>{
      'duration': instance.duration,
      'file_type': instance.fileType,
      'filename': instance.filename,
      'height': instance.height,
      'id': instance.id,
      'original_name': instance.originalName,
      'size': instance.size,
      'type': instance.type,
      'url': instance.url,
      'width': instance.width,
    };

// Extension for a UploadFileResponse class to provide 'copyWith' method
extension $UploadFileResponseExtension on UploadFileResponse {
  UploadFileResponse copyWith({
    int? duration,
    String? fileType,
    String? filename,
    int? height,
    int? id,
    String? originalName,
    int? size,
    String? type,
    String? url,
    int? width,
  }) {
    return UploadFileResponse(
      duration: duration ?? this.duration,
      fileType: fileType ?? this.fileType,
      filename: filename ?? this.filename,
      height: height ?? this.height,
      id: id ?? this.id,
      originalName: originalName ?? this.originalName,
      size: size ?? this.size,
      type: type ?? this.type,
      url: url ?? this.url,
      width: width ?? this.width,
    );
  }
}
