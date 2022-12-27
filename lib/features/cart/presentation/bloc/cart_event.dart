part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();

  @override
  List<Object> get props => [];
}

class AddToCart extends CartEvent {
  final String pdtid;
  final String name;
  final int price;

  const AddToCart(this.pdtid, this.name, this.price);
}

class RemoveFromCart extends CartEvent {
  final String id;

  const RemoveFromCart(this.id);
}

class RemoveSingleItemFromCart extends CartEvent {
  final String id;

  const RemoveSingleItemFromCart(this.id);
}

class GetTotalMoney extends CartEvent {
  final ProductEntity product;

  const GetTotalMoney(this.product);
}




// class ChangeQuantity extends CartEvent {
//   final ProductEntity item;
//   final bool isAdd;

//   const ChangeQuantity(this.item, this.isAdd);
// }
