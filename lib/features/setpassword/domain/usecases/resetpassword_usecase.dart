import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/resetpassword_entity.dart';
import '../repositories/resetPassword_repository.dart';

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
