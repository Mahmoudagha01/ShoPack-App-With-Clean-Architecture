
import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utilities/strings.dart';
import '../../domain/entities/register_entity.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_datasource.dart';

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
        return right(response);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }
}
