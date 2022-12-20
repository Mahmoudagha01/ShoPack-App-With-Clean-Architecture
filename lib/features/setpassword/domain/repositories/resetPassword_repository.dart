import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/resetpassword_entity.dart';

abstract class ResetPasswordRepository {
  Future<Either<Failure, ResetPasswordEntity>> resetPassword(ResetPasswordParams params);
}

class ResetPasswordParams {
  final String password;
  final String confirmPassword;

  ResetPasswordParams(this.password, this.confirmPassword);
}
