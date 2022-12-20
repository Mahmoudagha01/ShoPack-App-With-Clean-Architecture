import '../../../../core/network/api_provider.dart';
import '../../../../core/utilities/endpoints.dart';
import '../../domain/repositories/forgotpassword_repository.dart';
import '../models/forrgetpassword_model.dart';

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
