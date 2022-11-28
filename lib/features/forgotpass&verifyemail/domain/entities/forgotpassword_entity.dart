// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ForgotPasswordEntity extends Equatable {
  final bool success;
  final String message;

  const ForgotPasswordEntity(this.success, this.message);

  @override
  List<Object> get props => [success, message];
}
