import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/profile/domain/entities/profile_entity.dart';
import 'package:shop_app/features/profile/domain/repositories/profile_repository.dart';

class UpdatePasswordUsecase
    extends BaseUsecase<ProfileEntity, UpdatePasswordUsecaseParams> {
  final ProfileRepository profileRepository;

  UpdatePasswordUsecase(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(
      UpdatePasswordUsecaseParams params) async {
    return await profileRepository.updatePassword(UpdatePassParnms(params.oldPassword, params.newPassword, params.confirmPassword));
  }
}

class UpdatePasswordUsecaseParams {
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  UpdatePasswordUsecaseParams(
      this.oldPassword, this.newPassword, this.confirmPassword);
}
