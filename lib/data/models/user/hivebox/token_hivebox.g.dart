// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'token_hivebox.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TokenHiveboxAdapter extends TypeAdapter<TokenHivebox> {
  @override
  final int typeId = 1;

  @override
  TokenHivebox read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TokenHivebox(
      accessToken: fields[0] as String,
      refreshToken: fields[1] as String,
      isUser: fields[2] as bool?,
    );
  }

  @override
  void write(BinaryWriter writer, TokenHivebox obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.accessToken)
      ..writeByte(1)
      ..write(obj.refreshToken)
      ..writeByte(2)
      ..write(obj.isUser);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TokenHiveboxAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonGenerator
// **************************************************************************

// From Json Method
TokenHivebox _$TokenHiveboxFromJson(Map<String, dynamic> json) => TokenHivebox(
      accessToken: json['access_token'].toString().toAppString()!,
      refreshToken: json['refresh_token'].toString().toAppString()!,
      isUser: json['is_user'] == null ? null : json['is_user'] == true,
    );

// To Json Method
Map<String, dynamic> _$TokenHiveboxToJson(TokenHivebox instance) =>
    <String, dynamic>{
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'is_user': instance.isUser,
    };

// Extension for a TokenHivebox class to provide 'copyWith' method
extension $TokenHiveboxExtension on TokenHivebox {
  TokenHivebox copyWith({
    String? accessToken,
    String? refreshToken,
    bool? isUser,
  }) {
    return TokenHivebox(
      accessToken: accessToken ?? this.accessToken,
      refreshToken: refreshToken ?? this.refreshToken,
      isUser: isUser ?? this.isUser,
    );
  }
}
