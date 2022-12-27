import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'profile_entity.g.dart';

@HiveType(typeId: 1)
class ProfileEntity extends Equatable {
    @HiveField(0)
  final bool success;
    @HiveField(1)
  final UserEntity? user;
  @HiveField(2)
  final String? message;
  const ProfileEntity(this.success, this.user, this.message);

  @override
  List<Object?> get props => [success, user,message];
}
@HiveType(typeId: 2)
class UserEntity extends Equatable {
    @HiveField(0)
  final String id;
    @HiveField(1)
  final String name;
    @HiveField(2)
  final String email;
    @HiveField(3)
  final AvatarEntity ?avtar;
  const UserEntity(this.id, this.name, this.email, this.avtar);

  @override
  List<Object?> get props => [id, name, email, avtar];
}
@HiveType(typeId: 3)
class AvatarEntity extends Equatable {
    @HiveField(0)
  final String ?publicId;
    @HiveField(1)
  final String url;

  const AvatarEntity(this.publicId, this.url);

  @override
  List<Object?> get props => [publicId, url];
}
