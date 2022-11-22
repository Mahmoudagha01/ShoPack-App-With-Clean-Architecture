import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel(
      {required super.status, required super.message, required super.data});

  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        status: json["status"],
        message: json["message"],
        data: json["data"] != null
            ? RegisterDataModel.fromJson(json["data"])
            : null,
      );
}

class RegisterDataModel extends RegisterDataEntity {
  const RegisterDataModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.phone,
      required super.image,
      required super.token});
  factory RegisterDataModel.fromJson(Map<String, dynamic> json) =>
      RegisterDataModel(
        id: json["id"],
        name: json["name"],
        email: json["email"],
        phone: json["phone"],
        image: json["image"],
        token: json["token"],
      );
}
