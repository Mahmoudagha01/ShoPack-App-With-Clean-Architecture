part of 'forgetpassword_bloc.dart';

abstract class ForgetpasswordEvent extends Equatable {
  const ForgetpasswordEvent();

  @override
  List<Object> get props => [];
}

class SendLink extends ForgetpasswordEvent {
  final String email;

  const SendLink(this.email);
}
