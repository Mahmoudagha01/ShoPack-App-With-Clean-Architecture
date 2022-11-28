import 'package:dartz/dartz.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/entities/forgotpassword_entity.dart';

abstract class ForgotPasswordRepo {
  Future<Either<Failure, ForgotPasswordEntity>> getLink(ForgotParams params);
}

class ForgotParams {
  final String email;
  ForgotParams({
    required this.email,
  });
}
