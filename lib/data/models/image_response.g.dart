// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) =>
    ImageResponse(
      id: json['id'].toString().toAppInt(),
      attachmentId: json['attachment_id'].toString().toAppString()!,
      attachmentUrl: json['attachment_url'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$ImageResponseToJson(ImageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'attachment_id': instance.attachmentId,
      'attachment_url': instance.attachmentUrl,
    };

// Extension for a ImageResponse class to provide 'copyWith' method
extension $ImageResponseExtension on ImageResponse {
  ImageResponse copyWith({
    int? id,
    String? attachmentId,
    String? attachmentUrl,
  }) {
    return ImageResponse(
      id: id ?? this.id,
      attachmentId: attachmentId ?? this.attachmentId,
      attachmentUrl: attachmentUrl ?? this.attachmentUrl,
    );
  }
}
