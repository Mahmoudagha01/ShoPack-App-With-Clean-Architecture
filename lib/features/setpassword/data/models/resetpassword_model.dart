import 'package:shop_app/features/setpassword/domain/entities/resetpassword_entity.dart';

class ResetPasswordModel extends ResetPasswordEntity {
  const ResetPasswordModel(super.success, super.message);
  factory ResetPasswordModel.fromJson(Map<String, dynamic> json) =>
      ResetPasswordModel(json['success'], json['message']);
}
