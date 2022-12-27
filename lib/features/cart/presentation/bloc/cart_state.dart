part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();

  @override
  List<Object> get props => [];
}



class AddToCartState extends CartState {}

class RemoveFromCartState extends CartState {}

class ChangePriceState extends CartState {}

class CartInitial extends CartState {}

class CartLoading extends CartState {}

class CartLoaded extends CartState {
  final  Map<String, CartItem>  items;

  const CartLoaded(this.items);
}
// class CartLoading extends CartState {}

// class CartLoaded extends CartState {
//   final List<ProductEntity> items;
//   final ProductEntity? product;
//   final bool isAdded;
//   final bool isRemoved;
//   final double totalPrice;
//    int quantity;
//    CartLoaded([
//     this.items = const [],
//     this.isAdded = false,
//     this.isRemoved = false,
//     this.product,
//     this.totalPrice = 0,
//     this.quantity=1,
//   ]);
// }

// 
