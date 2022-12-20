import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../domin/entities/login_entity.dart';
import '../../domin/usecases/login_usecase.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginUsecase loginUsecase;
  
  LoginBloc(
    this.loginUsecase,
  ) : super(LoginInitialState()) {
    on<UserLogin>((event, emit) async {
      emit(LoginLoadingState());
      
        final failureOrSuccess = await loginUsecase(
          LoginUsecaseParams(email: event.email, password: event.password));
           failureOrSuccess.fold(

          (failure) => emit(LoginErrorState(failure.message)),
          (success) => emit(LoginFinishedState(data: success)));
   
      
     
    });
  }
}
