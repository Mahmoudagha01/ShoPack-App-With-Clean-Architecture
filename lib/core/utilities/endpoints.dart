import 'package:flutter_dotenv/flutter_dotenv.dart';

String baseUrlPath =  dotenv.env['BASE_URL']!;
const String paymentbaseUrlPath = 'https://accept.paymob.com/api';
const String placesAutocompeleteUrlPath ="https://maps.googleapis.com/maps/api/place/autocomplete/json";
const String placesUrlPath = "https://maps.googleapis.com/maps/api/place/details/json";
const String loginEndPoint = '/users/login';
const String registerEndPoint = '/users/register';
const String forgotPasswordEndPoint = '/users/password/forgot';
const String resetPasswordEndPoint = "/users/password/reset/";
const String profileEndPoint = '/users/me';
const String updateProfileEndPoint = '/users/profile/update';
const String updatePasswordEndPoint = '/users/password/update';
const String productsEndPoint = '/products';
const String reviewEndPoint ='/reviews';
const String getAllReviewsEndPoint ='/product/review';
const String newOrderEndPoint ='/order/new';
const String requestAuthEndPoint ='/auth/tokens';
const String requestOrderEndPoint ='/ecommerce/orders';
const String getAllOrdersEndPoint ='/orders/me';
const String requestPaymentEndPoint ='/acceptance/payment_keys';

String? code;
bool? isSkipedOnBoarding;
bool? isLoggedIN;