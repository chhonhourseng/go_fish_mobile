/// verify_otp_response
import 'package:app/export.dart';
import 'package:annotations/annotations.dart';
part 'verify_otp_response.g.dart';

@JsonAnnotation()
class VerifyOtpResponse {
  VerifyOtpResponse({
    required this.accessToken,
    required this.refreshToken,
  });

  final String accessToken;
  final String refreshToken;


//coverFileName: json['cover_file_name'].toString().toAppString()!,
// fromJson
  factory VerifyOtpResponse.fromJson(Map<String, dynamic> json) => _$VerifyOtpResponseFromJson(json);

// toJson
  Map<String, dynamic> toJson() => _$VerifyOtpResponseToJson(this);
}
