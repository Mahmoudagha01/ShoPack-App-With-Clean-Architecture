import '../../domain/entities/register_entity.dart';

class RegisterModel extends RegisterEntity {
  const RegisterModel(
      {required super.id,
      required super.name,
      required super.email,
      required super.createdAt,
      required super.role,
      required super.token});
  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        id: json["_id"]??"",
        name: json["name"]??"",
        email: json["email"]??"",
        createdAt: DateTime.parse(json["createdAt"]??""),
        role: json["role"]??"",
        token: json["token"]??"",
      );
}
