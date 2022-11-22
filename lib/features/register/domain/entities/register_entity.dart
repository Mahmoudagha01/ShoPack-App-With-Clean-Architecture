import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final bool status;
  final String message;
  final RegisterDataEntity? data;
  const RegisterEntity({
    required this.status,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class RegisterDataEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final String token;

  const RegisterDataEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.token});

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      phone,
      image,

      token,
    ];
  }
}
