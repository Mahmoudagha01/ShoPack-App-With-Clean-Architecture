import 'package:shopack_user/features/payment/domain/entities/auth_request_entity.dart';

class AuthRequestModel extends AuthRequestEntity {
  AuthRequestModel({required super.token,});
  factory AuthRequestModel.fromJson(Map<String, dynamic> json) =>
      AuthRequestModel(
        token: json["token"],
        
      );

 
}

