import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/login/domin/entities/login_entity.dart';

abstract class LoginBaseRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParams params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
