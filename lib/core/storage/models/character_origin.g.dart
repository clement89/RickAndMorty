// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_origin.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterOriginHiveAdapter extends TypeAdapter<CharacterOriginHive> {
  @override
  final int typeId = 1;

  @override
  CharacterOriginHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterOriginHive(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterOriginHive obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.url);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CharacterOriginHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
