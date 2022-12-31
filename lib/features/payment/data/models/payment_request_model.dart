import 'package:shopack_user/features/payment/domain/entities/payment_request_entity.dart';

class PaymenyRequestModel extends PaymentRequestEntity {
  const PaymenyRequestModel({required super.token});
  factory PaymenyRequestModel.fromJson(Map<String, dynamic> json) =>
      PaymenyRequestModel(token: json['token']);
}
