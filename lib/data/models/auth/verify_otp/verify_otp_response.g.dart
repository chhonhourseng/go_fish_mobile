// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_otp_response.dart';

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
VerifyOtpResponse _$VerifyOtpResponseFromJson(Map<String, dynamic> json) =>
    VerifyOtpResponse(
      accessToken: json['access_token'].toString().toAppString()!,
      refreshToken: json['refresh_token'].toString().toAppString()!,
    );

// To Json Method
Map<String, dynamic> _$VerifyOtpResponseToJson(VerifyOtpResponse instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
    };

// Extension for a VerifyOtpResponse class to provide 'copyWith' method
extension $VerifyOtpResponseExtension on VerifyOtpResponse {
  VerifyOtpResponse copyWith({
    String? accessToken,
    String? refreshToken,
  }) {
    return VerifyOtpResponse(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
    );
  }
}
