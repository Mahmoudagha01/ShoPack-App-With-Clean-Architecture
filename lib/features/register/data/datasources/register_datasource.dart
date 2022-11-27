import 'package:shop_app/core/utilities/constants.dart';
import 'package:shop_app/features/register/data/models/register_model.dart';
import '../../../../core/network/api_provider.dart';
import '../../domain/repositories/register_repository.dart';

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
