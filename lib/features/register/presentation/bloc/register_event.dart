part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}
class UserRegister extends RegisterEvent{
final String name;
  final String email;
  final String password;
  final String phone;

  const UserRegister(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone});
}