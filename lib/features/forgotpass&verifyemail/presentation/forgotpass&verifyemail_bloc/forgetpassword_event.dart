part of 'forgotpass&verifyemail_bloc.dart';

abstract class ForgotpassAndVerifyEmailEvent extends Equatable {
  const ForgotpassAndVerifyEmailEvent();

  @override
  List<Object> get props => [];
}

class SendLink extends ForgotpassAndVerifyEmailEvent {
  final String email;

  const SendLink(this.email);
}
