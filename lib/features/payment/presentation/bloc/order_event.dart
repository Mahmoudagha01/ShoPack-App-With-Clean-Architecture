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
   final List<Map<String, dynamic>> orderItems;
  final String phone;
  final String pinCode;
  final String address;
  final String city;
  final String country;
  final String status;
  final String id;
  final String state;

  const CreateNewOrder(this.itemsPrice, this.shippingPrice, this.totlaPrice, this.phone, this.pinCode, this.address, this.city, this.country, this.status, this.id, this.state, this.orderItems);
 }

 class GetAllOrders extends OrderEvent{}