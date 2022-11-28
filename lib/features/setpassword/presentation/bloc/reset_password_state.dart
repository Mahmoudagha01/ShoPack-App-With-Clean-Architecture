part of 'reset_password_bloc.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}

class ResetPasswordLoading extends ResetPasswordState {}

class ResetPasswordFinished extends ResetPasswordState {
  final ResetPasswordEntity data;

  const ResetPasswordFinished(this.data);
}

class ResetPasswordError extends ResetPasswordState {
  final String message;

  const ResetPasswordError(this.message);
}
