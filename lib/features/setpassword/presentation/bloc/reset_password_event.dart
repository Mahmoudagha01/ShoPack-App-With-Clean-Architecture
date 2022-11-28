part of 'reset_password_bloc.dart';

abstract class ResetPasswordEvent extends Equatable {
  const ResetPasswordEvent();

  @override
  List<Object> get props => [];
}
 class ConfirmPassword extends ResetPasswordEvent{
   final String password;
  final String confirmPassword;

  const ConfirmPassword(this.password, this.confirmPassword);
 }