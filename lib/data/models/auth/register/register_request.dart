
class RegisterRequest {
  final String phoneNumber;

  RegisterRequest({
    required this.phoneNumber,
  });

  Map<String, dynamic> toJson() => {
        "phone_number": phoneNumber,
      };
}
