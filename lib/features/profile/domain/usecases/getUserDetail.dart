import 'package:shop_app/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/profile/domain/entities/profile_entity.dart';
import 'package:shop_app/features/profile/domain/repositories/profile_repository.dart';

class GetUserDetails implements BaseUsecase<ProfileEntity, NoParams> {
  final ProfileRepository profileRepository;

  GetUserDetails(this.profileRepository);
  @override
  Future<Either<Failure, ProfileEntity>> call(NoParams params) async {
    return await profileRepository.getUserDetail();
  }
}
