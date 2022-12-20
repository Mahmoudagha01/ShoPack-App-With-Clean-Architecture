
import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/login_entity.dart';
import '../repositories/login_repository.dart';

class LoginUsecase extends BaseUsecase<LoginEntity, LoginUsecaseParams> {
  final LoginBaseRepository loginBaseRepository;

  LoginUsecase(this.loginBaseRepository);

  @override
  Future<Either<Failure, LoginEntity>> call(params) async {
    return await loginBaseRepository
        .login(LoginParams(email: params.email, password: params.password));
  }
}

class LoginUsecaseParams {
  final String email;
  final String password;

  LoginUsecaseParams({required this.email, required this.password});
}
