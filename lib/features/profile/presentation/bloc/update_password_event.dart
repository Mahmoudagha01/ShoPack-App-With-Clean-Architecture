part of 'update_password_bloc.dart';

abstract class UpdatePasswordEvent extends Equatable {
  const UpdatePasswordEvent();

  @override
  List<Object> get props => [];
}

class UserUpdatePassword extends UpdatePasswordEvent{
  final String oldPassword;
  final String newPassword;
  final String confirmPassword;

  const UserUpdatePassword(this.oldPassword, this.newPassword, this.confirmPassword);
}