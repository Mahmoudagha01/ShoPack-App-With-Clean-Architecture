import 'package:bloc/bloc.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop_app/core/usecase/usecase.dart';
import 'package:shop_app/features/profile/domain/usecases/getUserDetail.dart';
import 'package:shop_app/features/profile/domain/usecases/updateProfile.dart';

import '../../../../core/env/env.dart';
import '../../domain/entities/profile_entity.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ImagePicker imagePicker = ImagePicker();

  final GetUserDetails getUserDetails;
  final UpdateUserDetailUsecase updataProfile;
  CloudinaryResponse? response;
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
      emit(UpdateProfileLoadingState());
      final failureOrSuccess = await updataProfile(
          UpdateProfileUsecaseParams(event.name, event.email, event.avatar));
      failureOrSuccess.fold(
          (failure) => emit(UpdateProfileErrorState(failure.message)),
          (success) => emit(ProfileUpdateState(success)));
    });

    on<UploadImage>((event, emit) async {
      
      final XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
          emit(UploadImagesLoadingState());
      final cloudinary = Cloudinary.full(
          apiKey: Env.apiKey, apiSecret: Env.secretKey, cloudName: Env.nameKey);
      response = await cloudinary.uploadResource(CloudinaryUploadResource(
          filePath: selectedImage!.path,
          resourceType: CloudinaryResourceType.image,
          fileName: 'profile-avatar',
          progressCallback: (count, total) {
            print('Uploading image from file with progress: $count/$total');
          }));

      emit(UploadImageState(response!));
    });
  }
}