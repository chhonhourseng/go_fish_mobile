import 'package:app/export.dart';
import 'package:annotations/annotations.dart';
part '{{name.snakeCase()}}_response.g.dart';

@JsonAnnotation()
class {{name.pascalCase()}}Response {

  {{name.pascalCase()}}Response({
    required this.id,
  });

  final int id;

  // fromJson
  factory {{name.pascalCase()}}Response.fromJson(Map<String, dynamic> json) => _${{name.pascalCase()}}ResponseFromJson(json);
  // toJson
  Map<String, dynamic> toJson() => _${{name.pascalCase()}}ResponseToJson(this);
}

extension $Custom{{name.pascalCase()}}ResponseExtension on {{name.pascalCase()}}Response {

}