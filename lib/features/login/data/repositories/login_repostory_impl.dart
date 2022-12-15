import 'package:shop_app/core/error/error_handler.dart';
import 'package:shop_app/core/network/network_info.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/login/data/datasources/login_datasource.dart';
import 'package:shop_app/features/login/domin/entities/login_entity.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/features/login/domin/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginBaseRepository {
  final LoginDatasource loginDatasource;
  final NetworkInfo networkInfo;

  LoginRepositoryImpl(this.loginDatasource, this.networkInfo);

  @override
  Future<Either<Failure, LoginEntity>> login(LoginParams params) async {
    if (await networkInfo.isConnected) {
      try {
        final response = await loginDatasource.login(params);

        return right(response);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return const Left(OfflineFailure(AppStrings.noInternetError));
    }
  }
}
