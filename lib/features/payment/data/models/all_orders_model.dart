import '../../domain/entities/all_orders_entity.dart';

class AllOrdersModel extends AllOrdersEntity {
  const AllOrdersModel(super.success, super.order);
  factory AllOrdersModel.fromJson(Map<String, dynamic> json) =>
      AllOrdersModel(json['success'], List<OrderModel>.from(json['orders'].map((x)=>OrderModel.fromJson(x))) );
}

class OrderModel extends AllOrderEntity {
  const OrderModel(
      super.shippingInfo,
      super.orderItems,
      super.user,
      super.paymentInfo,
      super.paidAt,
      super.itemsPrice,
      super.shippingPrice,
      super.totalPrice,
      super.orderStatus,
      super.id);

  factory OrderModel.fromJson(Map<String, dynamic> json) => OrderModel(
      ShippingInfoModel.fromJson(json['shippingInfo']),
      List<OrderItemModel>.from(
          json['orderItems'].map((x) => OrderItemModel.fromJson(x))),
      json['user'],
      PaymentInfoModel.fromJson(json['paymentInfo']),
    DateTime.parse(json['paidAt']),
      json['itemsPrice'],
      json['shippingPrice'],
      json['totalPrice'],
      json['orderStatus'],
      json['_id']);
}

class ShippingInfoModel extends ShippingInfoEntity {
  const ShippingInfoModel(super.address, super.city, super.state, super.country,
      super.pincode, super.phone);
  factory ShippingInfoModel.fromJson(Map<String, dynamic> json) =>
      ShippingInfoModel(json['address'], json['city'], json['state'],
          json['country'], json['pinCode'], json['phoneNo']);
}

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel(
      super.name, super.image, super.id, super.price, super.quantity);
  factory OrderItemModel.fromJson(Map<String, dynamic> json) => OrderItemModel(
      json['name'],
      json['image'],
      json['_id'],
      json['price'],
      json['quantity']);
}

class PaymentInfoModel extends PaymentInfoEntity {
  const PaymentInfoModel(super.id, super.status);
  factory PaymentInfoModel.fromJson(Map<String, dynamic> json) =>
      PaymentInfoModel(json['id'], json['status']);
}
