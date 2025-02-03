import 'package:app/export.dart';

class UpdateUserInfoRequest {
  UpdateUserInfoRequest({
    required this.email,
    required this.gender,
    required this.username,
  });

  final String email;
  final GenderType gender;
  final String username;

  Map<String, dynamic> toJson() => {
        "email": email.toAppString(defaultVal: null),
        "gender": gender.name,
        "username": username,
      };
}
