// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Sources_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SourcesResponseAdapter extends TypeAdapter<SourcesResponse> {
  @override
  final typeId = 0;

  @override
  SourcesResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SourcesResponse(
      status: fields[0] as String?,
      sources: (fields[1] as List?)?.cast<Source>(),
      code: fields[2] as String?,
      message: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SourcesResponse obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.status)
      ..writeByte(1)
      ..write(obj.sources)
      ..writeByte(2)
      ..write(obj.code)
      ..writeByte(3)
      ..write(obj.message);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SourcesResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
