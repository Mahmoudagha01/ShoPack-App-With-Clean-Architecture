import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/register_entity.dart';

abstract class RegisterBaseRepository {
  Future<Either<Failure, RegisterEntity>> register(RegisterParams params);
}

class RegisterParams {
  final String name;
  final String email;
  final String password;


  RegisterParams(
      {required this.name,
      required this.email,
      required this.password,
      });
}
