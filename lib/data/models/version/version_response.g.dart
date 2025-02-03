// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'version_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
VersionResponse _$VersionResponseFromJson(Map<String, dynamic> json) =>
    VersionResponse(
      version: json['version'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$VersionResponseToJson(VersionResponse instance) =>
    <String, dynamic>{
      'version': instance.version,
    };

// Extension for a VersionResponse class to provide 'copyWith' method
extension $VersionResponseExtension on VersionResponse {
  VersionResponse copyWith({
    String? version,
  }) {
    return VersionResponse(
      version: version ?? this.version,
    );
  }
}
