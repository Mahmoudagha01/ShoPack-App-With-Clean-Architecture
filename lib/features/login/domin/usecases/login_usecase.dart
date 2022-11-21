import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/login/domin/entities/login_entity.dart';
import 'package:shop_app/features/login/domin/repositories/login_repository.dart';

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
