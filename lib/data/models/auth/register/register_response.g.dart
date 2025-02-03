// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
RegisterResponse _$RegisterResponseFromJson(Map<String, dynamic> json) =>
    RegisterResponse(
      key: json['key'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$RegisterResponseToJson(RegisterResponse instance) =>
    <String, dynamic>{
      'key': instance.key,
    };

// Extension for a RegisterResponse class to provide 'copyWith' method
extension $RegisterResponseExtension on RegisterResponse {
  RegisterResponse copyWith({
    String? key,
  }) {
    return RegisterResponse(
      key: key ?? this.key,
    );
  }
}
