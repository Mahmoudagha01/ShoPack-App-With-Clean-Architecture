import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/profile/domain/usecases/getUserDetail.dart';
import 'package:shop_app/features/profile/domain/usecases/updateProfile.dart';

import '../../domain/entities/profile_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final GetUserDetails getUserDetails;
  final UpdateUserDetailUsecase updataProfile;
  ProfileBloc(this.getUserDetails, this.updataProfile) : super(ProfileInitial()) {
    on<GetProfile>((event, emit) async {
      emit(ProfileLoadingState());
      final failureOrSuccess = await getUserDetails(NoParams());
      failureOrSuccess.fold(
          (failure) => emit(ProfileErrorState(failure.message)),
          (success) => emit(ProfileLoadedState(success)));
    });
  }
}
