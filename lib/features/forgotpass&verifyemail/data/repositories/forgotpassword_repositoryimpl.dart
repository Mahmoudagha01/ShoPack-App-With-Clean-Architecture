import 'package:dartz/dartz.dart';
import '../../../../core/error/error_handler.dart';
import '../../../../core/error/failure.dart';
import '../../../../core/network/network_info.dart';
import '../../../../core/utilities/strings.dart';
import '../../domain/entities/forgotpassword_entity.dart';
import '../../domain/repositories/forgotpassword_repository.dart';
import '../datasources/forgotpassword_datasource.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final ForgetPasswordDataSource forgetPasswordDataSource;
  final NetworkInfo networkInfo;

  ForgotPasswordRepoImpl(this.forgetPasswordDataSource, this.networkInfo);

  @override
  Future<Either<Failure, ForgotPasswordEntity>> getLink(
      ForgotParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await forgetPasswordDataSource
            .getLink(ForgotParams(email: params.email));
        return right(response);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }
}
