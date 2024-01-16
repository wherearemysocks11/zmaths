// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'questions.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QuestionsAdapter extends TypeAdapter<Questions> {
  @override
  final int typeId = 0;

  @override
  Questions read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Questions(
      fields[0] as String,
      fields[1] as String,
      fields[2] as String,
      fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, Questions obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.qnum)
      ..writeByte(1)
      ..write(obj.num1)
      ..writeByte(2)
      ..write(obj.num2)
      ..writeByte(3)
      ..write(obj.ans);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QuestionsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
