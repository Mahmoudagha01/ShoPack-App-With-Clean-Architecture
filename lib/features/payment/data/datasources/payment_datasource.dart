import 'package:shopack_user/core/network/api_provider.dart';
import 'package:shopack_user/core/utilities/endpoints.dart';
import 'package:shopack_user/features/payment/data/models/auth_request_model.dart';
import 'package:shopack_user/features/payment/data/models/order_request_model.dart';
import 'package:shopack_user/features/payment/data/models/payment_request_model.dart';
import 'package:shopack_user/features/payment/domain/repositories/payment_repository.dart';

abstract class PaymentDataSource {
  Future<AuthRequestModel> requestAuth(RequestAuthParams params);
  Future<OrderRequestModel> requestOrder(OrderRequestParams params);
  Future<PaymenyRequestModel> requestPayment(PaymentRequestParams params);
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final APIProvider apiProvider;

  PaymentDataSourceImpl(this.apiProvider);
  @override
  Future<AuthRequestModel> requestAuth(RequestAuthParams params) async {
    final response = await apiProvider.post(endPoint: requestAuthEndPoint,data: {
      'api_key':params.apiKey
    });
    return AuthRequestModel.fromJson(response.data);
  }

  @override
  Future<OrderRequestModel> requestOrder(OrderRequestParams params) async{
   final response = await apiProvider.post(endPoint: requestAuthEndPoint,data: {
      'auth_token':params.token,
      'amount_cents':params.totlaPrice
    });
    return OrderRequestModel.fromJson(response.data);
  }

  @override
  Future<PaymenyRequestModel> requestPayment(PaymentRequestParams params) async{
final response = await apiProvider.post(endPoint: requestAuthEndPoint,data: {
      'auth_token':params.token,
      'amount_cents':params.totlaPrice,
      'order_id':params.orderId,
      "billing_data": {
    "apartment": "NA", 
    "email": params.email, 
    "floor": "NA", 
    "first_name": params.firstName, 
    "street": params.street, 
    "building": "NA", 
    "phone_number": params.phone, 
    "shipping_method": "NA", 
    "postal_code": "NA", 
    "city": params.city, 
    "country": params.country, 
    "last_name":params.lastName, 
    "state": params.state
  }, 
      'integration_id':params.integrationId,
   "currency": "EGP",
    });
    return PaymenyRequestModel.fromJson(response.data);
  }
}
