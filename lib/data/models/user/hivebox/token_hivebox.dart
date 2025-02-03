import 'package:app/export.dart';
import 'package:annotations/annotations.dart';

part 'token_hivebox.g.dart';

typedef TokenResponse = TokenHivebox;

@JsonAnnotation()
@HiveType(typeId: 1)
class TokenHivebox {
  TokenHivebox({
    required this.accessToken,
    required this.refreshToken,
    required this.isUser,
  });

  @HiveField(0)
  final String accessToken;

  @HiveField(1)
  final String refreshToken;

  @HiveField(2)
  final bool? isUser;

  factory TokenHivebox.fromJson(Map<String, dynamic> json) => _$TokenHiveboxFromJson(json);

  Map<String, dynamic> toJson() => _$TokenHiveboxToJson(this);
}

extension $CustomTokenHiveboxExtension on TokenHivebox {
  bool get getIsUser {
    return true;
  }
}
