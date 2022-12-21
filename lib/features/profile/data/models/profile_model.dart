
import '../../domain/entities/profile_entity.dart';

class ProfileModel extends ProfileEntity {
  const ProfileModel(super.success, super.user,super.message);
  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      ProfileModel(json['success'],json['user']!=null? UserModel.fromJson(json['user']):null,json['message']??'');
}

class UserModel extends UserEntity {
  const UserModel(super.id, super.name, super.email, super.avtar);
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      json['_id'],
      json['name'],
      json['email'],
    json['avatar']!=null? AvatarModel.fromJson(json['avatar']):null);
}

class AvatarModel extends AvatarEntity {
  const AvatarModel(super.publicId, super.url);
  factory AvatarModel.fromJson(Map<String, dynamic> json) =>
      AvatarModel(json['public_id'], json['url']);
}
