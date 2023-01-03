import 'package:equatable/equatable.dart';

class AllOrdersEntity extends Equatable {
  final bool success;

  final List<AllOrderEntity> orders;

  const AllOrdersEntity(this.success, this.orders, );

  @override
  List<Object> get props => [success, orders];
}

class AllOrderEntity extends Equatable {
  final ShippingInfoEntity shippingInfo;
  final List<OrderItemEntity> orderItems;
  final String user;
  final PaymentInfoEntity paymentInfo;
  final DateTime paidAt;
  final int itemsPrice;
  final int shippingPrice;
  final int totalPrice;
  final String orderStatus;
  final String id;
  const AllOrderEntity(
      this.shippingInfo,
      this.orderItems,
      this.user,
      this.paymentInfo,
      this.paidAt,
      this.itemsPrice,
      this.shippingPrice,
      this.totalPrice,
      this.orderStatus,
      this.id);

  @override
  List<Object> get props {
    return [
      shippingInfo,
      orderItems,
      user,
      paymentInfo,
      paidAt,
      itemsPrice,
      shippingPrice,
      totalPrice,
      orderStatus,
    ];
  }
}

class ShippingInfoEntity extends Equatable {
  final String address;
  final String city;
  final String state;
  final String country;
  final String pincode;
  final String phone;

  const ShippingInfoEntity(this.address, this.city, this.state, this.country,
      this.pincode, this.phone);

  @override
  List<Object> get props {
    return [
      address,
      city,
      state,
      country,
      pincode,
      phone,
    ];
  }
}

class OrderItemEntity extends Equatable {
  final String name;
  final String image;
  final String id;
  final int price;
  final int quantity;

  const OrderItemEntity(
      this.name, this.image, this.id, this.price, this.quantity);

  @override
  List<Object> get props {
    return [
      name,
      image,
      id,
      price,
      quantity,
    ];
  }
}

class PaymentInfoEntity extends Equatable {
  final String id;
  final String status;

  const PaymentInfoEntity(this.id, this.status);

  @override
  List<Object> get props => [id, status];
}
