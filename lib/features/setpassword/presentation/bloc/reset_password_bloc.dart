import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/features/setpassword/domain/usecases/resetpassword_usecase.dart';

import '../../domain/entities/resetpassword_entity.dart';

part 'reset_password_event.dart';
part 'reset_password_state.dart';

class ResetPasswordBloc extends Bloc<ResetPasswordEvent, ResetPasswordState> {
  final ResetPasswordUseCase resetPasswordUseCase;
  ResetPasswordBloc(this.resetPasswordUseCase) : super(ResetPasswordInitial()) {
    on<ConfirmPassword>((event, emit) async {
      emit(ResetPasswordLoading());
      final failureOrSuccess = await resetPasswordUseCase(
          ResetPassUsecaseParams(event.password, event.confirmPassword));

      failureOrSuccess.fold(
          (failure) => emit(ResetPasswordError(failure.message)),
          (success) => emit(ResetPasswordFinished(success)));
    });
  }
}
