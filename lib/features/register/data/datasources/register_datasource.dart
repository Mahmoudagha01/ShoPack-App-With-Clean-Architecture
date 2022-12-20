
import '../../../../core/network/api_provider.dart';
import '../../../../core/utilities/endpoints.dart';
import '../../domain/repositories/register_repository.dart';
import '../models/register_model.dart';

abstract class RegisterBaseDatasource {
  Future<RegisterModel> register(RegisterParams params);
}

class RegisterDataSourceImpl implements RegisterBaseDatasource {
  final APIProvider apiProvider;

  RegisterDataSourceImpl(this.apiProvider);
  @override
  Future<RegisterModel> register(RegisterParams params) async {
    final response = await apiProvider.post(endPoint:registerEndPoint, data: {
      "name": params.name,
      "email": params.email,
      "password": params.password,
    });
    return RegisterModel.fromJson(response.data);
  }
}
