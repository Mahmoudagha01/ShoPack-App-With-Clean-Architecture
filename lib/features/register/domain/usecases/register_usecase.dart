import 'package:dartz/dartz.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/register_entity.dart';
import '../repositories/register_repository.dart';

class RegisterUsecase
    extends BaseUsecase<RegisterEntity, RegisterUsecaseParams> {
  final RegisterBaseRepository registerBaseRepository;

  RegisterUsecase(this.registerBaseRepository);

  @override
  Future<Either<Failure, RegisterEntity>> call(params) async {
    return await registerBaseRepository.register(RegisterParams(
        name: params.name,
        email: params.email,
        password: params.password,
        ));
  }
}

class RegisterUsecaseParams {
  final String name;
  final String email;
  final String password;
  

  RegisterUsecaseParams(
      {required this.name,
      required this.email,
      required this.password,
  });
}
