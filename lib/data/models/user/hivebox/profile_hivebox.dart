import 'package:app/export.dart';
import 'package:annotations/annotations.dart';

part 'profile_hivebox.g.dart';

typedef ProfileResponse = ProfileHiveBox;

@JsonAnnotation()
@HiveType(typeId: 5)
class ProfileHiveBox extends HiveObject {
  ProfileHiveBox({
    required this.id,
    required this.email,
    //required this.isVerify,
    required this.phoneNumber,
    required this.profile,
    required this.type,
    required this.username,
    required this.avatarUrl,
    required this.gender,
  });

  @HiveField(0)
  final int id;
  @HiveField(1)
  final String? email;
  @HiveField(3)
  final String? phoneNumber;
  @HiveField(4)
  final String? profile;
  @HiveField(5)
  final String type;
  @HiveField(6)
  final String username;
  @HiveField(8)
  final String avatarUrl;
  @HiveField(9)
  final String? gender;

  factory ProfileHiveBox.fromJson(Map<String, dynamic> json) => _$ProfileHiveBoxFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileHiveBoxToJson(this);
}

extension $CustomProfileHiveBoxExtension on ProfileHiveBox {
  GenderType get getGender {
    try {
      if (kDebugMode) {}
      return GenderType.values.firstWhere((e) => e.name == type);
    } catch (_) {
      if (kDebugMode) {}
      return GenderType.female;
    }
  }

  String get subName => phoneNumber ?? (email ?? '');
}
