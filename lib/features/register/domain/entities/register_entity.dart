import 'package:equatable/equatable.dart';

class RegisterEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final DateTime createdAt;
  final String role;
  final String token;

  const RegisterEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.token,
    required this.createdAt,
    required this.role,
  });

  @override
  List<Object> get props {
    return [id, name, email, token, role, createdAt];
  }
}
