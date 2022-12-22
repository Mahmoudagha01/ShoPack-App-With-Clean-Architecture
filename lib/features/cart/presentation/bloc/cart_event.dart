part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent {}

class ItemAdded extends CartEvent {
  final ProductEntity item;
  const ItemAdded(this.item);
}

class ItemRemoved extends CartEvent {
  final ProductEntity item;
  const ItemRemoved(this.item);
}

class ChangeQuantity extends CartEvent {
  final ProductEntity item;
  final bool isAdd;

  const ChangeQuantity(this.item, this.isAdd);
}
