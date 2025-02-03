/// image_response
import 'package:app/export.dart';
import 'package:annotations/annotations.dart';

part 'image_response.g.dart';

@JsonAnnotation()
class ImageResponse {

  ImageResponse({
    required this.id,
    required this.attachmentId,
    required this.attachmentUrl,
  });

  final int id;
  final String attachmentId;
  final String attachmentUrl;

  // fromJson
  factory ImageResponse.fromJson(Map<String, dynamic> json) => _$ImageResponseFromJson(json);

  // toJson
  Map<String, dynamic> toJson() => _$ImageResponseToJson(this);
}

extension $CustomImageResponseExtension on ImageResponse {
}