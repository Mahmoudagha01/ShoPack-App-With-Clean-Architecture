import 'package:shopack_user/core/network/api_provider.dart';
import 'package:shopack_user/core/usecase/usecase.dart';
import 'package:shopack_user/core/utilities/endpoints.dart';
import 'package:shopack_user/features/payment/data/models/all_orders_model.dart';
import 'package:shopack_user/features/payment/data/models/auth_request_model.dart';
import 'package:shopack_user/features/payment/data/models/neworder_model.dart';
import 'package:shopack_user/features/payment/data/models/order_request_model.dart';
import 'package:shopack_user/features/payment/data/models/payment_request_model.dart';
import 'package:shopack_user/features/payment/domain/repositories/payment_repository.dart';
import '../../../../core/local/shared_preference.dart';
import '../../../../core/network/paymentApiProvider.dart';

abstract class PaymentDataSource {
  Future<AuthRequestModel> requestAuth(RequestAuthParams params);
  Future<OrderRequestModel> requestOrder(OrderRequestParams params);
  Future<PaymenyRequestModel> requestPayment(PaymentRequestParams params);
  Future<NewOrderModel> createNewOrder(CreateNewOrderParams params);
  Future<AllOrdersModel> getAllOrders(NoParams params);
}

class PaymentDataSourceImpl implements PaymentDataSource {
  final PaymentAPIProvider apiProvider;
  final APIProvider apiBaseProvider;
  PaymentDataSourceImpl(
    this.apiProvider,
    this.apiBaseProvider,
  );
  @override
  Future<AuthRequestModel> requestAuth(RequestAuthParams params) async {
    final response = await apiProvider
        .post(endPoint: requestAuthEndPoint, data: {'api_key': params.apiKey});
    return AuthRequestModel.fromJson(response.data);
  }

  @override
  Future<OrderRequestModel> requestOrder(OrderRequestParams params) async {
    final response = await apiProvider.post(
        endPoint: requestOrderEndPoint,
        data: {'auth_token': params.token, 'amount_cents': params.totlaPrice});
    return OrderRequestModel.fromJson(response.data);
  }

  @override
  Future<PaymenyRequestModel> requestPayment(
      PaymentRequestParams params) async {
    final response =
        await apiProvider.post(endPoint: requestPaymentEndPoint, data: {
      'auth_token': params.token,
      'amount_cents': params.totlaPrice,
      'order_id': params.orderId,
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
        "last_name": params.lastName,
        "state": params.state
      },
      'integration_id': params.integrationId,
      "currency": "EGP",
    });
    return PaymenyRequestModel.fromJson(response.data);
  }

  @override
  Future<NewOrderModel> createNewOrder(CreateNewOrderParams params) async {
    final response = await apiBaseProvider.post(
        endPoint: newOrderEndPoint,
        token: PreferenceHelper.getDataFromSharedPreference(
                            key: 'token') ?? '',
        data: ({
          "itemsPrice": params.itemsPrice,
          "shippingPrice": params.shippingPrice,
          "totalPrice": params.totlaPrice,
          "orderItems": params.orderItems,
          "shippingInfo": {
            "address": params.address,
            "city": params.city,
            "state": params.state,
            "country": params.country,
            "pinCode": params.pinCode,
            "phoneNo": params.phone
          },
          "paymentInfo": {"id": params.id, "status": params.status}
        }));
    return NewOrderModel.fromJson(response.data);
  }

  @override
  Future<AllOrdersModel> getAllOrders(NoParams params) async {
    final response = await apiBaseProvider.get(
        endPoint: getAllOrdersEndPoint, token: PreferenceHelper.getDataFromSharedPreference(
                            key: 'token') ?? "");
    return AllOrdersModel.fromJson(response.data);
  }
}
