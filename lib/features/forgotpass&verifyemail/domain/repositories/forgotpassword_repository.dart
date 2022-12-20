import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/forgotpassword_entity.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, ForgotPasswordEntity>> getLink(ForgotParams params);
}

class ForgotParams {
  final String email;
  ForgotParams({
    required this.email,
  });
}
