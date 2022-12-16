import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/profile/domain/usecases/getUserDetail.dart';
import 'package:shop_app/features/profile/domain/usecases/updateProfile.dart';

import '../../domain/entities/profile_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
    final ImagePicker imagePicker = ImagePicker();
  final GetUserDetails getUserDetails;
  final UpdateUserDetailUsecase updataProfile;
  ProfileBloc(this.getUserDetails, this.updataProfile)
      : super(ProfileInitial()) {
    on<GetProfile>((event, emit) async {
      emit(ProfileLoadingState());
      final failureOrSuccess = await getUserDetails(NoParams());
      failureOrSuccess.fold(
          (failure) => emit(ProfileErrorState(failure.message)),
          (success) => emit(ProfileLoadedState(success)));
    });

    on<UpdataProfileEvent>((event, emit) async {
       emit(ProfileLoadingState());
      final failureOrSuccess = await updataProfile(UpdateProfileUsecaseParams(event.name, event.email, event.avatar));
      failureOrSuccess.fold(
          (failure) => emit(ProfileErrorState(failure.message)),
          (success) => emit(ProfileLoadedState(success)));
    });

      on<UploadImage>((event, emit) async {
      emit(UploadImagesLoadingState());
      final XFile selectedImage = await imagePicker.pickImage();
   
      emit(UploadImagesState(imageFileList));
     
    });
  }
}
