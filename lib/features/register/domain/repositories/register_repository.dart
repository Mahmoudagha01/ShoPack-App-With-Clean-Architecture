import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/register/domain/entities/register_entity.dart';

abstract class RegisterBaseRepository {
  Future<Either<Failure, RegisterEntity>> register(RegisterParams params);
}

class RegisterParams {
  final String name;
  final String email;
  final String password;
  final String phone;

  RegisterParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});
}
