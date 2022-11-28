// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class ResetPasswordEntity extends Equatable {
   final bool success;
  final String message;

  const ResetPasswordEntity(this.success, this.message);
  
  @override
 
  List<Object> get props => [success, message];
}
