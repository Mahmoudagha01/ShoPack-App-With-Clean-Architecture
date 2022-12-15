import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/profile/domain/entities/profile_entity.dart';
import 'package:shop_app/features/profile/domain/repositories/profile_repository.dart';

class UpdateUserDetailUsecase
    implements BaseUsecase<ProfileEntity, UpdateProfileUsecaseParams> {
  final ProfileRepository profileRepository;

  UpdateUserDetailUsecase(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(
      UpdateProfileUsecaseParams params) async {
    return await profileRepository.updateProfile(UpdateProfileParams(params.name, params.email, params.avatar));
  }
}

class UpdateProfileUsecaseParams {
  final String name;
  final String email;
  final String avatar;

  UpdateProfileUsecaseParams(this.name, this.email, this.avatar);
}
