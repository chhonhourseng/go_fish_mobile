/// register_response
import 'package:app/export.dart';
import 'package:annotations/annotations.dart';

part 'register_response.g.dart';

@JsonAnnotation()
class RegisterResponse {
  RegisterResponse({
    required this.key,
  });

  final String key;

  factory RegisterResponse.fromJson(Map<String, dynamic> json) => _$RegisterResponseFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterResponseToJson(this);
}
