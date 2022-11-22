// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/utilities/constants.dart';
import 'package:shop_app/features/register/domain/usecases/register_usecase.dart';
import '../../domain/entities/register_entity.dart';
part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterUsecase registerUsecase;
  RegisterBloc(
    this.registerUsecase,
  ) : super(RegisterInitialState()) {
    on<UserRegister>((event, emit) async {
      emit(RegisterLoadingState());
      final failureOrSuccess = await registerUsecase(RegisterUsecaseParams(
          name: event.name,
          email: event.email,
          password: event.password,
          phone: event.phone));
      failureOrSuccess.fold(
          (failure) => emit(RegisterErrorState(mapFailureToMessage(failure))),
          (success) => emit(RegisterFinishedState(data: success)));
    });
  }
}
