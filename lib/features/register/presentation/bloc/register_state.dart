// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'register_bloc.dart';

abstract class RegisterState extends Equatable {
  const RegisterState();

  @override
  List<Object> get props => [];
}

class RegisterInitialState extends RegisterState {}

class RegisterLoadingState extends RegisterState {}

class RegisterFinishedState extends RegisterState {
  final RegisterEntity data;
  const RegisterFinishedState({
    required this.data,
  });
}

class RegisterErrorState extends RegisterState {
  final String message;

  const RegisterErrorState(this.message);
}
