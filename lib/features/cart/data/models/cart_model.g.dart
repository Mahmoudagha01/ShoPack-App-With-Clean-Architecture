// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductAdapter extends TypeAdapter<CartProduct> {
  @override
  final int typeId = 4;

  @override
  CartProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProduct(
      id: fields[0] as String,
      name: fields[1] as String,
      description: fields[2] as String,
      price: fields[3] as int,
      ratings: fields[4] as num,
      productImage: fields[5] as String,
      category: fields[6] as String,
      stock: fields[7] as int,
      numOfReviews: fields[8] as int,
      user: fields[9] as String,
      isFavourite: fields[10] as bool,
      amount: fields[11] as num,
    );
  }

  @override
  void write(BinaryWriter writer, CartProduct obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.description)
      ..writeByte(3)
      ..write(obj.price)
      ..writeByte(4)
      ..write(obj.ratings)
      ..writeByte(5)
      ..write(obj.productImage)
      ..writeByte(6)
      ..write(obj.category)
      ..writeByte(7)
      ..write(obj.stock)
      ..writeByte(8)
      ..write(obj.numOfReviews)
      ..writeByte(9)
      ..write(obj.user)
      ..writeByte(10)
      ..write(obj.isFavourite)
      ..writeByte(11)
      ..write(obj.amount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
