part of 'forgotpass&verifyemail_bloc.dart';

abstract class ForgetpasswordAndeVerifyEmailState extends Equatable {
  const ForgetpasswordAndeVerifyEmailState();

  @override
  List<Object> get props => [];

  
}



class ForgetpasswordLoadingState extends ForgetpasswordAndeVerifyEmailState {}

class ForgetpasswordFinishedState extends ForgetpasswordAndeVerifyEmailState {
  final ForgotPasswordEntity data;

  const ForgetpasswordFinishedState(this.data);
}

class ForgetpasswordErrorState extends ForgetpasswordAndeVerifyEmailState {
  final String message;

  const ForgetpasswordErrorState(this.message);
}

class ForgotStausState extends ForgetpasswordAndeVerifyEmailState{}

class VerifyStausState extends ForgetpasswordAndeVerifyEmailState{}