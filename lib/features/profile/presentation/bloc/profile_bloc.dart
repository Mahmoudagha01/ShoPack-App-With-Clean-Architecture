import 'package:bloc/bloc.dart';
import 'package:cloudinary_sdk/cloudinary_sdk.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/profile_entity.dart';
import '../../domain/usecases/getUserDetail.dart';
import '../../domain/usecases/updateProfile.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final ImagePicker imagePicker = ImagePicker();
  String userName = '';
  String userEmail = '';
  final GetUserDetails getUserDetails;
  final UpdateUserDetailUsecase updataProfile;
  CloudinaryResponse? response;
  ProfileBloc(this.getUserDetails, this.updataProfile)
      : super(ProfileInitial()) {
    on<GetProfile>((event, emit) async {
      emit(ProfileLoadingState());
      final failureOrSuccess = await getUserDetails(NoParams());
      failureOrSuccess.fold(
          (failure) => emit(ProfileErrorState(failure.message)), (success) {
        userName = success.user!.name;
        userEmail = success.user!.email;
        emit(ProfileLoadedState(success));
      });
    });

    on<UpdataProfileEvent>((event, emit) async {
      emit(UpdateProfileLoadingState());
      final failureOrSuccess = await updataProfile(
          UpdateProfileUsecaseParams(event.name, event.email, event.avatar));
      failureOrSuccess.fold(
          (failure) => emit(UpdateProfileErrorState(failure.message)),
          (success) {
              userName = success.user!.name;
        userEmail = success.user!.email;
             emit(ProfileUpdateState(success));
          });
    });

    on<UploadImage>((event, emit) async {
      final XFile? selectedImage =
          await imagePicker.pickImage(source: ImageSource.gallery);
      emit(UploadImagesLoadingState());
      final cloudinary = Cloudinary.full(
          apiKey: dotenv.env['CLOUDINARY_API_KEY']!,
          apiSecret: dotenv.env['CLOUDINARY_SECRET_KEY']!,
          cloudName: dotenv.env['CLOUDINARY_NAME']!);
      response = await cloudinary.uploadResource(CloudinaryUploadResource(
        filePath: selectedImage!.path,
        resourceType: CloudinaryResourceType.image,
        fileName: 'profile-avatar',
      ));

      emit(UploadImageState(response!));
    });
  }
}
