// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'group.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class GroupAdapter extends TypeAdapter<Group> {
  @override
  final int typeId = 1;

  @override
  Group read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Group(
      name: fields[0] as String,
      desc: fields[1] as String,
      target: fields[2] as String?,
      date: fields[3] as String?,
      dayPart: fields[4] as String,
      regular: fields[5] as bool,
      regularType: fields[6] as String?,
      isDone: fields[7] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Group obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.desc)
      ..writeByte(2)
      ..write(obj.target)
      ..writeByte(3)
      ..write(obj.date)
      ..writeByte(4)
      ..write(obj.dayPart)
      ..writeByte(5)
      ..write(obj.regular)
      ..writeByte(6)
      ..write(obj.regularType)
      ..writeByte(7)
      ..write(obj.isDone);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is GroupAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
