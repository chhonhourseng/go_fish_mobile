/// remember_login_request
class RememberLoginRequest {
  final String id;
  final bool isRemember;

  RememberLoginRequest({
    required this.id,
    required this.isRemember,
  });

  Map<String, dynamic> toMap() => {
        "deviceId": id,
        "isRemember": isRemember,
      };
}
