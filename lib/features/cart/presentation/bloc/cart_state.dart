part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}
class CartInitial extends CartState {}

class AddToCartState extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final List items;
  const CartLoaded(this.items);
}

class IncrementCountState extends CartState {

}
class DecrementCountState extends CartState {
  
}