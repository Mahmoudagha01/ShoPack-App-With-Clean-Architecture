import 'package:shopack_user/features/payment/domain/entities/order_request_entity.dart';

class OrderRequestModel extends OrderRequest {
  OrderRequestModel(
      {required super.id,
     });

  factory OrderRequestModel.fromJson(Map<String, dynamic> json) =>
      OrderRequestModel(
        id: json["id"]??0,
     
      );
}

