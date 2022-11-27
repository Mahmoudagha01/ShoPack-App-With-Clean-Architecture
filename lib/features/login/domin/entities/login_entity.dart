import 'package:equatable/equatable.dart';

class LoginEntity extends Equatable {
  final String ? id;
  final String? name;
  final String? email;
  final String? role;
  final String ?message;
  final bool ?success;
  final DateTime ?createdAt;
  final String? token;

  const LoginEntity(
      { this.id,
       this.name,
       this.message,
       this.success,
       this.email,
       this.role,
       this.createdAt,
       this.token});

  @override
  List<Object?> get props {
    return [
      id,
      name,
      email,
      success,
      message,
      role,
      createdAt,
      token,
    ];
  }
}
