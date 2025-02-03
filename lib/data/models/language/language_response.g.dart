// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'language_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
LanguageResponse _$LanguageResponseFromJson(Map<String, dynamic> json) =>
    LanguageResponse(
      id: json['id'].toString().toAppInt(),
      name: json['name'].toString().toAppString()!,
      nativeName: json['native_name'].toString().toAppString()!,
      code: json['code'].toString().toAppString()!,
      flag: json['flag'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$LanguageResponseToJson(LanguageResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'native_name': instance.nativeName,
      'code': instance.code,
      'flag': instance.flag,
    };

// Extension for a LanguageResponse class to provide 'copyWith' method
extension $LanguageResponseExtension on LanguageResponse {
  LanguageResponse copyWith({
    int? id,
    String? name,
    String? nativeName,
    String? code,
    String? flag,
  }) {
    return LanguageResponse(
      id: id ?? this.id,
      name: name ?? this.name,
      nativeName: nativeName ?? this.nativeName,
      code: code ?? this.code,
      flag: flag ?? this.flag,
    );
  }
}
