import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/setpassword/domain/entities/resetpassword_entity.dart';
import 'package:shop_app/features/setpassword/domain/repositories/resetPassword_repository.dart';

class ResetPasswordUseCase
    extends BaseUsecase<ResetPasswordEntity, ResetPassUsecaseParams> {
  final ResetPasswordRepository resetPasswordRepository;

  ResetPasswordUseCase(this.resetPasswordRepository);
  @override
  Future<Either<Failure, ResetPasswordEntity>> call(
      ResetPassUsecaseParams params) async {
    return await resetPasswordRepository.resetPassword(
        ResetPasswordParams(params.password, params.confirmPassword));
  }
}

class ResetPassUsecaseParams {
  final String password;
  final String confirmPassword;

  ResetPassUsecaseParams(this.password, this.confirmPassword);
}
