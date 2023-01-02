part of 'order_bloc.dart';

abstract class OrderEvent extends Equatable {
  const OrderEvent();

  @override
  List<Object> get props => [];
}
 class CreateNewOrder extends OrderEvent{
    final int itemsPrice;
  final int shippingPrice;
  final int totlaPrice;
  final String name;
  final int price;
  final int quantity;
  final String image;
  final String phone;
  final String pinCode;
  final String address;
  final String city;
  final String country;
  final String status;
  final String id;
  final String state;

  const CreateNewOrder(this.itemsPrice, this.shippingPrice, this.totlaPrice, this.name, this.price, this.quantity, this.image, this.phone, this.pinCode, this.address, this.city, this.country, this.status, this.id, this.state);
 }