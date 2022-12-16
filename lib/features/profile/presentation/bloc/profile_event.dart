part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}

class UpdataProfileEvent extends ProfileEvent {
  final String name;
  final String email;
  final String avatar;

  const UpdataProfileEvent(this.name, this.email, this.avatar);}

class UploadImage extends ProfileEvent {

}