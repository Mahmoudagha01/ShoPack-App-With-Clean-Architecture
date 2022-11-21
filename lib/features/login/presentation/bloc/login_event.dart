part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class UserLogin extends LoginEvent {
  final String email;
  final String password;

  const UserLogin(this.email, this.password);
}
