import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/features/forgotpass&verifyemail/domain/usecases/forgotpassword_usecase.dart';
import '../../domain/entities/forgotpassword_entity.dart';
part 'forgetpassword_event.dart';
part 'forgetpassword_state.dart';

class ForgetpasswordBloc
    extends Bloc<ForgetpasswordEvent, ForgetpasswordState> {
  final ForgotPassUsecase forgotPassUsecase;
  ForgetpasswordBloc(this.forgotPassUsecase) : super(ForgetpasswordInitial()) {
    on<SendLink>((event, emit) async {
      emit(ForgetpasswordLoadingState());
      final failureOrSuccess =
          await forgotPassUsecase(ForgetPasswordUsecaseParams(event.email));
      failureOrSuccess.fold((failure) => emit(ForgetpasswordErrorState(failure.message)),
          (success) => emit(ForgetpasswordFinishedState(success)));
    });
  }
}
