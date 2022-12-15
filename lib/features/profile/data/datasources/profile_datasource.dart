
import 'package:shop_app/core/utilities/endpoints.dart';
import 'package:shop_app/features/profile/data/models/profile_model.dart';
import 'package:shop_app/features/profile/domain/repositories/profile_repository.dart';
import '../../../../core/network/api_provider.dart';

abstract class ProfileDatasource {
  Future<ProfileModel> getUserDetails();
  Future<ProfileModel> updateProfile(UpdateProfileParams params);
}

class PeofileDataSourceImpl implements ProfileDatasource {
  final APIProvider apiProvider;

  PeofileDataSourceImpl(this.apiProvider);
  @override
  Future<ProfileModel> getUserDetails() async {
    final response = await apiProvider.get(endPoint: profileEndPoint);
    return ProfileModel.fromJson(response.data);
  }

  @override
  Future<ProfileModel> updateProfile(UpdateProfileParams params) async {
    final response =
        await apiProvider.put(endPoint: updateProfileEndPoint, data: {
      "avatar": params.avatar,
      "name": params.name,
      "email": params.email,
    });
    return ProfileModel.fromJson(response.data);
  }
}
