
import 'package:equatable/equatable.dart';

class OrderRequest extends Equatable {
   int id;
  DateTime createdAt;
  bool deliveryNeeded;
  Merchant merchant;
  dynamic collector;
  int amountCents;
  ShippingData shippingData;
  String currency;
  bool isPaymentLocked;
  bool isReturn;
  bool isCancel;
  bool isReturned;
  bool isCanceled;
  String merchantOrderId;
  dynamic walletNotification;
  int paidAmountCents;
  bool notifyUserWithEmail;
  List<Item> items;
  String orderUrl;
  int commissionFees;
  int deliveryFeesCents;
  int deliveryVatCents;
  String paymentMethod;
  dynamic merchantStaffTag;
  String apiSource;
  Data data;
  String token;
  String url;
  OrderRequest({
    required this.id,
    required this.createdAt,
    required this.deliveryNeeded,
    required this.merchant,
    required this.collector,
    required this.amountCents,
    required this.shippingData,
    required this.currency,
    required this.isPaymentLocked,
    required this.isReturn,
    required this.isCancel,
    required this.isReturned,
    required this.isCanceled,
    required this.merchantOrderId,
    required this.walletNotification,
    required this.paidAmountCents,
    required this.notifyUserWithEmail,
    required this.items,
    required this.orderUrl,
    required this.commissionFees,
    required this.deliveryFeesCents,
    required this.deliveryVatCents,
    required this.paymentMethod,
    required this.merchantStaffTag,
    required this.apiSource,
    required this.data,
    required this.token,
    required this.url,
  });
  
  @override

  List<Object> get props {
    return [
      id,
      createdAt,
      deliveryNeeded,
      merchant,
      collector,
      amountCents,
      shippingData,
      currency,
      isPaymentLocked,
      isReturn,
      isCancel,
      isReturned,
      isCanceled,
      merchantOrderId,
      walletNotification,
      paidAmountCents,
      notifyUserWithEmail,
      items,
      orderUrl,
      commissionFees,
      deliveryFeesCents,
      deliveryVatCents,
      paymentMethod,
      merchantStaffTag,
      apiSource,
      data,
      token,
      url,
    ];
  }
}
class Data extends Equatable{
  @override
 
  List<Object?> get props => [];

}
class Item extends Equatable {
   final String name;
  final String description;
  final int amountCents;
  final int quantity;
  const Item({
    required this.name,
    required this.description,
    required this.amountCents,
    required this.quantity,
  });

  @override
  List<Object> get props => [name, description, amountCents, quantity];
}
class Merchant extends Equatable {
 int id;
  DateTime createdAt;
  List<String> phones;
  List<String> companyEmails;
  String companyName;
  String state;
  String country;
  String city;
  String postalCode;
  String street; 
  Merchant({
    required this.id,
    required this.createdAt,
    required this.phones,
    required this.companyEmails,
    required this.companyName,
    required this.state,
    required this.country,
    required this.city,
    required this.postalCode,
    required this.street,
  });

  @override
  List<Object> get props {
    return [
      id,
      createdAt,
      phones,
      companyEmails,
      companyName,
      state,
      country,
      city,
      postalCode,
      street,
    ];
  }
}
class ShippingData extends Equatable {
   int id;
  String firstName;
  String lastName;
  String street;
  String building;
  String floor;
  String apartment;
  String city;
  String state;
  String country;
  String email;
  String phoneNumber;
  String postalCode;
  String extraDescription;
  String shippingMethod;
  int orderId;
  int order;
  ShippingData({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.building,
    required this.floor,
    required this.apartment,
    required this.city,
    required this.state,
    required this.country,
    required this.email,
    required this.phoneNumber,
    required this.postalCode,
    required this.extraDescription,
    required this.shippingMethod,
    required this.orderId,
    required this.order,
  });

  @override
  List<Object> get props {
    return [
      id,
      firstName,
      lastName,
      street,
      building,
      floor,
      apartment,
      city,
      state,
      country,
      email,
      phoneNumber,
      postalCode,
      extraDescription,
      shippingMethod,
      orderId,
      order,
    ];
  }
}
