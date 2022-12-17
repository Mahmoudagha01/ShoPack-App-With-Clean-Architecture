import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/utilities/endpoints.dart';
import 'package:shop_app/features/setpassword/data/models/resetpassword_model.dart';
import 'package:shop_app/features/setpassword/domain/repositories/resetPassword_repository.dart';

import '../../../../core/local/shared_preference.dart';

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
            "$resetPasswordEndPoint${PreferenceHelper.getDataFromSharedPreference(key: "Link")}",
        data: {
          "password": params.password,
          "confirmPassword": params.confirmPassword
        });

    return ResetPasswordModel.fromJson(response.data);
  }
}
