import 'package:shop_app/core/network/api_provider.dart';
import 'package:shop_app/core/utilities/constants.dart';
import 'package:shop_app/features/forgotpass&verifyemail/data/models/forrgetpassword_model.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/repositories/forgotpassword_repository.dart';

abstract class ForgetPasswordDataSource {
  Future<ForgotPasswordModel> getLink(ForgotParams params);
}

class ForgetPasswordDataSourceImpl implements ForgetPasswordDataSource {
  final APIProvider apiProvider;

  ForgetPasswordDataSourceImpl(this.apiProvider);
  @override
  Future<ForgotPasswordModel> getLink(ForgotParams params) async {
    final response = await apiProvider
        .post(endPoint: forgotPasswordEndPoint, data: {"email": params.email});

    return ForgotPasswordModel.fromJson(response.data);
  }
}
