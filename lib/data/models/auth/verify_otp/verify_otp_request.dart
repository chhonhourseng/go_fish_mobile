/// verify_otp_request
import 'package:app/export.dart';

class VerifyOtpRequest {
  final String code;
  final String key;

  VerifyOtpRequest({
    required this.code,
    required this.key,
  });

  Map<String, dynamic> toJson() => {
        "code": code,
        "device": app.device?.toJson(),
        "key": key,
      };
}
