// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'text.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class TextModelAdapter extends TypeAdapter<TextModel> {
  @override
  final int typeId = 0;

  @override
  TextModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return TextModel(
      header: fields[0] as String,
      text: fields[1] as String,
      supabaseId: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, TextModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.header)
      ..writeByte(1)
      ..write(obj.text)
      ..writeByte(2)
      ..write(obj.supabaseId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is TextModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
