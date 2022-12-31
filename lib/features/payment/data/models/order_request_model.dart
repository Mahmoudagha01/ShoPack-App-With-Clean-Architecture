import 'package:shopack_user/features/payment/domain/entities/order_request_entity.dart';

class OrderRequestModel extends OrderRequest {
  OrderRequestModel(
      {required super.id,
      required super.createdAt,
      required super.deliveryNeeded,
      required super.merchant,
      required super.collector,
      required super.amountCents,
      required super.shippingData,
      required super.currency,
      required super.isPaymentLocked,
      required super.isReturn,
      required super.isCancel,
      required super.isReturned,
      required super.isCanceled,
      required super.merchantOrderId,
      required super.walletNotification,
      required super.paidAmountCents,
      required super.notifyUserWithEmail,
      required super.items,
      required super.orderUrl,
      required super.commissionFees,
      required super.deliveryFeesCents,
      required super.deliveryVatCents,
      required super.paymentMethod,
      required super.merchantStaffTag,
      required super.apiSource,
      required super.data,
      required super.token,
      required super.url});

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      OrderRequestModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        deliveryNeeded: json["delivery_needed"],
        merchant: MerchantModel.fromJson(json["merchant"]),
        collector: json["collector"],
        amountCents: json["amount_cents"],
        shippingData: ShippingDataModel.fromJson(json["shipping_data"]),
        currency: json["currency"],
        isPaymentLocked: json["is_payment_locked"],
        isReturn: json["is_return"],
        isCancel: json["is_cancel"],
        isReturned: json["is_returned"],
        isCanceled: json["is_canceled"],
        merchantOrderId: json["merchant_order_id"],
        walletNotification: json["wallet_notification"],
        paidAmountCents: json["paid_amount_cents"],
        notifyUserWithEmail: json["notify_user_with_email"],
        items: List<Item>.from(json["items"].map((x) => ItemModel.fromJson(x))),
        orderUrl: json["order_url"],
        commissionFees: json["commission_fees"],
        deliveryFeesCents: json["delivery_fees_cents"],
        deliveryVatCents: json["delivery_vat_cents"],
        paymentMethod: json["payment_method"],
        merchantStaffTag: json["merchant_staff_tag"],
        apiSource: json["api_source"],
        data: DataModel.fromJson(json["data"]),
        token: json["token"],
        url: json["url"],
      );
}

class DataModel extends Data {
  DataModel();
  factory DataModel.fromJson(Map<String, dynamic> json) => DataModel();
}
class ItemModel extends Item{
  ItemModel({required super.name, required super.description, required super.amountCents, required super.quantity});
  factory ItemModel.fromJson(Map<String, dynamic> json) => ItemModel(
    name: json["name"],
    description: json["description"],
    amountCents: json["amount_cents"],
    quantity: json["quantity"],
  );

}
class ShippingDataModel extends ShippingData{
  ShippingDataModel({required super.id, required super.firstName, required super.lastName, required super.street, required super.building, required super.floor, required super.apartment, required super.city, required super.state, required super.country, required super.email, required super.phoneNumber, required super.postalCode, required super.extraDescription, required super.shippingMethod, required super.orderId, required super.order});
  factory ShippingDataModel.fromJson(Map<String, dynamic> json) => ShippingDataModel(
    id: json["id"],
    firstName: json["first_name"],
    lastName: json["last_name"],
    street: json["street"],
    building: json["building"],
    floor: json["floor"],
    apartment: json["apartment"],
    city: json["city"],
    state: json["state"],
    country: json["country"],
    email: json["email"],
    phoneNumber: json["phone_number"],
    postalCode: json["postal_code"],
    extraDescription: json["extra_description"],
    shippingMethod: json["shipping_method"],
    orderId: json["order_id"],
    order: json["order"],
  );
}
class MerchantModel extends Merchant {
  MerchantModel(
      {required super.id,
      required super.createdAt,
      required super.phones,
      required super.companyEmails,
      required super.companyName,
      required super.state,
      required super.country,
      required super.city,
      required super.postalCode,
      required super.street});
  factory MerchantModel.fromJson(Map<String, dynamic> json) => MerchantModel(
        id: json["id"],
        createdAt: DateTime.parse(json["created_at"]),
        phones: List<String>.from(json["phones"].map((x) => x)),
        companyEmails: List<String>.from(json["company_emails"].map((x) => x)),
        companyName: json["company_name"],
        state: json["state"],
        country: json["country"],
        city: json["city"],
        postalCode: json["postal_code"],
        street: json["street"],
      );
}
