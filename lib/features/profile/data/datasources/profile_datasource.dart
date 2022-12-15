import '../../../../core/network/api_provider.dart';
import '../../../../core/utilities/endpoints.dart';
import '../../domain/repositories/profile_repository.dart';
import '../models/profile_model.dart';

abstract class ProfileDatasource {
  Future<ProfileModel> getUserDetails();
  Future<ProfileModel> updateProfile(UpdateProfileParams params);
}

class ProfileDataSourceImpl implements ProfileDatasource {
  final APIProvider apiProvider;

  ProfileDataSourceImpl(this.apiProvider);
  @override
  Future<ProfileModel> getUserDetails() async {
    final response = await apiProvider.get(endPoint: profileEndPoint, token: token ?? '',);
    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> updateProfile(UpdateProfileParams params) async {
    final response = await apiProvider.put(
      endPoint: updateProfileEndPoint,
      data: {
        "avatar": params.avatar,
        "name": params.name,
        "email": params.email,
      },
      token: token ?? '',
    );
    return ProfileModel.fromJson(response.data);
  }
}
