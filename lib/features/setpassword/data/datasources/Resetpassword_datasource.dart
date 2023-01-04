
import '../../../../core/local/shared_preference.dart';
import '../../../../core/network/api_provider.dart';
import '../../../../core/utilities/endpoints.dart';
import '../../domain/repositories/resetPassword_repository.dart';
import '../models/resetpassword_model.dart';

abstract class ResetPasswordDatasource {
  Future<ResetPasswordModel> resetPassword(ResetPasswordParams params);
}

class ResetPasswordDataSourceImpl implements ResetPasswordDatasource {

  final APIProvider apiProvider;

  ResetPasswordDataSourceImpl( this.apiProvider);
  @override
  Future<ResetPasswordModel> resetPassword(ResetPasswordParams params) async {
    final response = await apiProvider.put(
        endPoint:
            '$resetPasswordEndPoint$code',
        data: {
          "password": params.password,
          "confirmPassword": params.confirmPassword
        });

    return ResetPasswordModel.fromJson(response.data);
  }
}
