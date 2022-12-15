part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class ProfileLoadingState extends ProfileState {}

class ProfileLoadedState extends ProfileState {
  final ProfileEntity data;

  const ProfileLoadedState(this.data);
}

class ProfileErrorState extends ProfileState {
  final String message;

  const ProfileErrorState(this.message);
}
