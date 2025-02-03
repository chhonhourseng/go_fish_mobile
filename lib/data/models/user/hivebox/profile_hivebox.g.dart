// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_hivebox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProfileHiveBoxAdapter extends TypeAdapter<ProfileHiveBox> {
  @override
  final int typeId = 5;

  @override
  ProfileHiveBox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProfileHiveBox(
      id: fields[0] as int,
      email: fields[1] as String?,
      phoneNumber: fields[3] as String?,
      profile: fields[4] as String?,
      type: fields[5] as String,
      username: fields[6] as String,
      avatarUrl: fields[8] as String,
      gender: fields[9] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ProfileHiveBox obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(3)
      ..write(obj.phoneNumber)
      ..writeByte(4)
      ..write(obj.profile)
      ..writeByte(5)
      ..write(obj.type)
      ..writeByte(6)
      ..write(obj.username)
      ..writeByte(8)
      ..write(obj.avatarUrl)
      ..writeByte(9)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProfileHiveBoxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
ProfileHiveBox _$ProfileHiveBoxFromJson(Map<String, dynamic> json) =>
    ProfileHiveBox(
      id: json['id'].toString().toAppInt(),
      email:
          json['email'] == null ? null : json['email'].toString().toAppString(),
      phoneNumber: json['phone_number'] == null
          ? null
          : json['phone_number'].toString().toAppString(),
      profile: json['profile'] == null
          ? null
          : json['profile'].toString().toAppString(),
      type: json['type'].toString().toAppString()!,
      username: json['username'].toString().toAppString()!,
      avatarUrl: json['avatar_url'].toString().toAppString()!,
      gender: json['gender'] == null
          ? null
          : json['gender'].toString().toAppString(),
    );

// To Json Method
Map<String, dynamic> _$ProfileHiveBoxToJson(ProfileHiveBox instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'profile': instance.profile,
      'type': instance.type,
      'username': instance.username,
      'avatar_url': instance.avatarUrl,
      'gender': instance.gender,
    };

// Extension for a ProfileHiveBox class to provide 'copyWith' method
extension $ProfileHiveBoxExtension on ProfileHiveBox {
  ProfileHiveBox copyWith({
    int? id,
    String? email,
    String? phoneNumber,
    String? profile,
    String? type,
    String? username,
    String? avatarUrl,
    String? gender,
  }) {
    return ProfileHiveBox(
      id: id ?? this.id,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profile: profile ?? this.profile,
      type: type ?? this.type,
      username: username ?? this.username,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      gender: gender ?? this.gender,
    );
  }
}
