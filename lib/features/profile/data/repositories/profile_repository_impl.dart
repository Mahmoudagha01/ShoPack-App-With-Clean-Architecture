import 'package:shop_app/core/error/error_handler.dart';
import 'package:shop_app/core/network/network_info.dart';
import 'package:shop_app/core/utilities/strings.dart';
import 'package:shop_app/features/profile/data/datasources/profile_datasource.dart';
import 'package:shop_app/features/profile/domain/entities/profile_entity.dart';
import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/features/profile/domain/repositories/profile_repository.dart';

class ProfileRepositoryImpl implements ProfileRepository {
  final ProfileDatasource profileDatasource;
  final NetworkInfo networkInfo;

  ProfileRepositoryImpl(this.profileDatasource, this.networkInfo);
  @override
  Future<Either<Failure, ProfileEntity>> getUserDetail() async {
    if (await networkInfo.isConnected) {
      try {
        final data = await profileDatasource.getUserDetails();

        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updateProfile(
      UpdateProfileParams updateProfileParams) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await profileDatasource.updateProfile(updateProfileParams);
        return right(data);
      } catch (error) {
        print(error);
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }

  @override
  Future<Either<Failure, ProfileEntity>> updatePassword(
      UpdatePassParnms params) async {
    if (await networkInfo.isConnected) {
      try {
        final data = await profileDatasource.updatePassword(params);
        return right(data);
      } catch (error) {
        return left(ErrorHandler.handle(error).failure);
      }
    } else {
      return left(const OfflineFailure(AppStrings.noInternetError));
    }
  }
}