import 'package:equatable/equatable.dart';

class AuthRequestEntity extends Equatable {
   final String token;

  const AuthRequestEntity({
    required this.token,
  
  });

  @override
  List<Object> get props => [token,];
}




