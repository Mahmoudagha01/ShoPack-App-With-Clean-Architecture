import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/register/domain/entities/register_entity.dart';
import 'package:shop_app/features/register/domain/repositories/register_repository.dart';

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
        phone: params.phone));
  }
}

class RegisterUsecaseParams {
  final String name;
  final String email;
  final String password;
  final String phone;

  RegisterUsecaseParams(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});
}
