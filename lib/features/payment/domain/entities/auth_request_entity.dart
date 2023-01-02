// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class AuthRequestEntity extends Equatable {
    String token;

  AuthRequestEntity({
    required this.token,
  
  });

  @override
  List<Object> get props => [token,];
}




