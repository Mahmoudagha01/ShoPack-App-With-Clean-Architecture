
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/forgotpassword_entity.dart';
import '../repositories/forgotpassword_repository.dart';

class ForgotPassUsecase
    implements BaseUsecase <ForgotPasswordEntity , ForgetPasswordUsecaseParams> {
  final ForgotPasswordRepo forgotPasswordRepo;

  ForgotPassUsecase(this.forgotPasswordRepo);

  @override
  Future<Either<Failure, ForgotPasswordEntity>> call(
      ForgetPasswordUsecaseParams params) async {
    return await forgotPasswordRepo.getLink(ForgotParams(email: params.email));
  }
}

class ForgetPasswordUsecaseParams {
  final String email;

  ForgetPasswordUsecaseParams(this.email);
}
