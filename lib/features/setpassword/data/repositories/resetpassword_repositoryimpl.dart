import 'package:shop_app/core/error/error_handler.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/setpassword/data/datasources/Resetpassword_datasource.dart';
import 'package:shop_app/features/setpassword/domain/entities/resetpassword_entity.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/features/setpassword/domain/repositories/resetPassword_repository.dart';

import '../../../../core/network/network_info.dart';

class ResetPasswordRepositoryImpl implements ResetPasswordRepository {
  @override
  final NetworkInfo networkInfo;
  final ResetPasswordDatasource resetPasswordDatasource;

  ResetPasswordRepositoryImpl(this.networkInfo, this.resetPasswordDatasource);
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
