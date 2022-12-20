import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../entities/login_entity.dart';

abstract class LoginBaseRepository {
  Future<Either<Failure, LoginEntity>> login(LoginParams params);
}

class LoginParams {
  final String email;
  final String password;

  LoginParams({required this.email, required this.password});
}
