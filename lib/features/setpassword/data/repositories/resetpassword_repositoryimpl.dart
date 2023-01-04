import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utilities/strings.dart';
import '../../domain/entities/resetpassword_entity.dart';
import '../../domain/repositories/resetPassword_repository.dart';
import '../datasources/Resetpassword_datasource.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  final NetworkInfo networkInfo;
  final ResetPasswordDatasource resetPasswordDatasource;

  ResetPasswordRepositoryImpl(this.networkInfo, this.resetPasswordDatasource);
  @override
  Future<Either<Failure, ResetPasswordEntity>> resetPassword(
      ResetPasswordParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await resetPasswordDatasource.resetPassword(
            ResetPasswordParams(params.password, params.confirmPassword));
        return right(data);
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }
}
