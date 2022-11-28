part of 'forgetpassword_bloc.dart';

abstract class ForgetpasswordState extends Equatable {
  const ForgetpasswordState();

  @override
  List<Object> get props => [];

  
}

class ForgetpasswordInitial extends ForgetpasswordState {}

class ForgetpasswordLoadingState extends ForgetpasswordState {}

class ForgetpasswordFinishedState extends ForgetpasswordState {
  final ForgotPasswordEntity data;

  const ForgetpasswordFinishedState(this.data);
}

class ForgetpasswordErrorState extends ForgetpasswordState {
  final String message;

  const ForgetpasswordErrorState(this.message);
}
