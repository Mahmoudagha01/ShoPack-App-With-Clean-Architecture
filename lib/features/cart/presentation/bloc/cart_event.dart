part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class CartStarted extends CartEvent{
  
}
class AddToCart extends CartEvent {
  final ProductEntity product;
  const AddToCart(this.product);
}

class RemoveFromCart extends CartEvent {
  final int id;

  const RemoveFromCart(this.id);
}

class IncrementCount extends CartEvent {
  final CartProduct cartProduct;

  const IncrementCount(this.cartProduct);
}

class DecrementCount extends CartEvent {
  final CartProduct cartProduct;

  const DecrementCount(this.cartProduct);
}
