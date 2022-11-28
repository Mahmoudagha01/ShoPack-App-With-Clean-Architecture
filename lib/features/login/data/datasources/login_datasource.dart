import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/utilities/endpoints.dart';
import 'package:shop_app/features/login/data/models/login_model.dart';
import 'package:shop_app/features/login/domin/repositories/login_repository.dart';


abstract class LoginDatasource {
  Future<LoginModel> login(LoginParams params);
}

class LoginDatasourceImpl implements LoginDatasource {
  final APIProvider apiProvider;

  LoginDatasourceImpl(this.apiProvider);
  @override
  Future<LoginModel> login(LoginParams params) async {
    final response = await apiProvider.post(endPoint: loginEndPoint, data: {
      "email": params.email,
      "password": params.password,
    });

      return LoginModel.fromJson(response.data);
  
  }
}
