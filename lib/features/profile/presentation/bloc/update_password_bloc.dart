import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/usecases/updatePassword.dart';

part 'update_password_event.dart';
part 'update_password_state.dart';

class UpdatePasswordBloc
    extends Bloc<UpdatePasswordEvent, UpdatePasswordState> {
  final UpdatePasswordUsecase updatePasswordUsecase;
  UpdatePasswordBloc(this.updatePasswordUsecase)
      : super(UpdatePasswordInitial()) {
    on<UserUpdatePassword>((event, emit) async {
      emit(UpdatePasswordLoading());
      final failureOrSuccess = await updatePasswordUsecase(
          UpdatePasswordUsecaseParams(
              event.oldPassword, event.newPassword, event.confirmPassword));
      failureOrSuccess.fold(
          (failure) => emit(UpdatePasswordError(failure.message)),
          (success) => emit(UpdatePasswordLoaded(success)));
    });
  }
}
