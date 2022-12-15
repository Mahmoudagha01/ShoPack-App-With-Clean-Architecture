part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetProfile extends ProfileEvent {}

class UpdataProfile extends ProfileEvent {
  final String name;
  final String email;
  final String avatar;

  const UpdataProfile(this.name, this.email, this.avatar);}
