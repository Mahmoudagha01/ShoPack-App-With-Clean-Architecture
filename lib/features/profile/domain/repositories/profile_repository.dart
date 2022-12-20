import 'package:dartz/dartz.dart';
import '../../../../core/error/failure.dart';
import '../entities/profile_entity.dart';

abstract class ProfileRepository {
  Future<Either<Failure, ProfileEntity>> getUserDetail();
  Future<Either<Failure, ProfileEntity>> updateProfile(
      UpdateProfileParams updateProfileParams);
  Future<Either<Failure, ProfileEntity>> updatePassword(UpdatePassParnms params);
}

class UpdateProfileParams {
  final String name;
  final String email;
  final String avatar;

  UpdateProfileParams(this.name, this.email, this.avatar);
}

class UpdatePassParnms {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  UpdatePassParnms(this.oldPassword, this.newPassword, this.confirmPassword);
}
