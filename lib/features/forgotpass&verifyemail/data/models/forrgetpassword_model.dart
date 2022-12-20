
import '../../domain/entities/forgotpassword_entity.dart';

class ForgotPasswordModel extends ForgotPasswordEntity {
  const ForgotPasswordModel(super.success, super.message);
  
  factory ForgotPasswordModel.fromJson(Map<String, dynamic> json) =>
      ForgotPasswordModel(json['success'], json['message']);
}
