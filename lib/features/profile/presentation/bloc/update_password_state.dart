part of 'update_password_bloc.dart';

abstract class UpdatePasswordState extends Equatable {
  const UpdatePasswordState();

  @override
  List<Object> get props => [];
}

class UpdatePasswordInitial extends UpdatePasswordState {}

class UpdatePasswordLoading extends UpdatePasswordState {}

class UpdatePasswordLoaded extends UpdatePasswordState {
  final ProfileEntity data;

  const UpdatePasswordLoaded(this.data);
}

class UpdatePasswordError extends UpdatePasswordState {
  final String message;

  const UpdatePasswordError(this.message);
}
