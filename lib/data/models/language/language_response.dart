import 'package:app/export.dart';
import 'package:annotations/annotations.dart';
part 'language_response.g.dart';

@JsonAnnotation()
class LanguageResponse {

  LanguageResponse({
    required this.id,
    required this.name,
    required this.nativeName,
    required this.code,
    required this.flag,
  });

  final int id;
  final String name;
  final String nativeName;
  final String code;
  final String flag;
  // fromJson
  factory LanguageResponse.fromJson(Map<String, dynamic> json) => _$LanguageResponseFromJson(json);
  // toJson
  Map<String, dynamic> toJson() => _$LanguageResponseToJson(this);
}

extension $CustomLanguageResponseExtension on LanguageResponse {

}