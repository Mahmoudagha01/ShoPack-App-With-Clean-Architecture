// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_hive.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ThemeDatabaseAdapter extends TypeAdapter<ThemeDatabase> {
  @override
  final int typeId = 0;

  @override
  ThemeDatabase read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ThemeDatabase(
      themeSettings: fields[0] as int,
    );
  }

  @override
  void write(BinaryWriter writer, ThemeDatabase obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.themeSettings);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ThemeDatabaseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
