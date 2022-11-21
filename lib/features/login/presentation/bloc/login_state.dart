// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'login_bloc.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginFinishedState extends LoginState {
  final LoginEntity data;
  const LoginFinishedState({
    required this.data,
  });
}

class LoginErrorState extends LoginState {
  final String message;

  const LoginErrorState(this.message);
}
