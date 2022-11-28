import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/entities/forgotpassword_entity.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/repositories/forgotpassword_repository.dart';

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
