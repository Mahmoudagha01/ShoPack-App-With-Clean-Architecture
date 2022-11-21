import 'package:shop_app/features/login/domin/entities/login_entity.dart';

class LoginModel extends LoginEntity {
  const LoginModel(
      {required super.status, required super.message, required super.data});

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] !=null ?LoginDataModel.fromJson(json["data"]):null,
      );
}

class LoginDataModel extends LoginDataEntity {
  const LoginDataModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.phone,
      required super.image,
      required super.points,
      required super.credit,
      required super.token});
  factory LoginDataModel.fromJson(Map<String, dynamic> json) => LoginDataModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        points: json["points"],
        credit: json["credit"],
        token: json["token"],
      );
}
