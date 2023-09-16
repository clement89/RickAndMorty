// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'character_location.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CharacterLocationHiveAdapter extends TypeAdapter<CharacterLocationHive> {
  @override
  final int typeId = 2;

  @override
  CharacterLocationHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CharacterLocationHive(
      name: fields[0] as String,
      url: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CharacterLocationHive obj) {
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
      other is CharacterLocationHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
