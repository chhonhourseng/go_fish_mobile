import 'package:app/export.dart';
import 'package:annotations/annotations.dart';
part 'version_response.g.dart';

@JsonAnnotation()
class VersionResponse {

  VersionResponse({
    required this.version,
  });

  final String version;
  // fromJson
  factory VersionResponse.fromJson(Map<String, dynamic> json) => _$VersionResponseFromJson(json);
  // toJson
  Map<String, dynamic> toJson() => _$VersionResponseToJson(this);
}

extension $CustomVersionResponseExtension on VersionResponse {

}