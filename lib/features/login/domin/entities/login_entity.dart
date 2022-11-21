import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final bool status;
  final String message;
  final LoginDataEntity? data;
  const LoginEntity({
    required this.status,
    required this.message,
    this.data,
  });

  @override
  List<Object?> get props => [status, message, data];
}

class LoginDataEntity extends Equatable {
  final int id;
  final String name;
  final String email;
  final String phone;
  final String image;
  final int points;
  final int credit;
  final String token;

  const LoginDataEntity(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.image,
      required this.points,
      required this.credit,
      required this.token});

  @override
  List<Object> get props {
    return [
      id,
      name,
      email,
      phone,
      image,
      points,
      credit,
      token,
    ];
  }
}
