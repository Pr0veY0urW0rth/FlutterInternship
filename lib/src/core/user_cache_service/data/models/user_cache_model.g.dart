// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_cache_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserCacheModelAdapter extends TypeAdapter<UserCacheModel> {
  @override
  final int typeId = 1;

  @override
  UserCacheModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserCacheModel(
      dataPassword: fields[2] as String,
      email: fields[0] as String,
      isSavingInSupabase: fields[3] as bool,
      token: fields[1] as String,
      isUsingPassword: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserCacheModel obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.email)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.dataPassword)
      ..writeByte(3)
      ..write(obj.isSavingInSupabase)
      ..writeByte(4)
      ..write(obj.isUsingPassword);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserCacheModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
