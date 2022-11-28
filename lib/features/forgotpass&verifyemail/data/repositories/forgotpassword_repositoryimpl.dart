import 'package:shop_app/core/error/error_handler.dart';
import 'package:shop_app/core/network/network_info.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/forgotpass&verifyemail/data/datasources/forgotpassword_datasource.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/entities/forgotpassword_entity.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/repositories/forgotpassword_repository.dart';

class ForgotPasswordRepoImpl implements ForgotPasswordRepo {
  final ForgetPasswordDataSource forgetPasswordDataSource;
  final NetworkInfo networkInfo;

  ForgotPasswordRepoImpl(this.forgetPasswordDataSource, this.networkInfo);

  @override
  Future<Either<Failure, ForgotPasswordEntity>> getLink(ForgotParams params) async {
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
