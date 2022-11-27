import 'package:shop_app/features/register/data/datasources/register_datasource.dart';
import 'package:shop_app/features/register/domain/entities/register_entity.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/features/register/domain/repositories/register_repository.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/network/network_info.dart';

class RegisterRepositoryImpl implements RegisterBaseRepository {
  final RegisterBaseDatasource registerBaseDatasource;
  final NetworkInfo networkInfo;

  RegisterRepositoryImpl(this.registerBaseDatasource, this.networkInfo);
  @override
  Future<Either<Failure, RegisterEntity>> register(
      RegisterParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await registerBaseDatasource.register(params);
        return (right(response));
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(OfflineFailure(""));
    }
  }
}
