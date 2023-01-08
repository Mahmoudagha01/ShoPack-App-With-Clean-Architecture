import 'package:hive_flutter/hive_flutter.dart';

import '../../../../core/local/cache_manager.dart';
import '../../domain/entities/profile_entity.dart';

class CacheManager implements CacheManagerBase<ProfileEntity> {
  @override
  Future<void> init() async {
    registerAdapter();

    await Hive.openBox("profile-cahce");
  }

  @override
  Future<void> addItem(ProfileEntity item) async {
    await Hive.box("profile-cahce").add(item);
  }

  @override
  void registerAdapter() {
    if (!Hive.isAdapterRegistered(1)) {
      Hive.registerAdapter(ProfileEntityAdapter());
      Hive.registerAdapter(UserEntityAdapter());
      Hive.registerAdapter(AvatarEntityAdapter());
    }
  }

  @override
  ProfileEntity? getItem(String key) {
    return Hive.box("profile-cahce").get(
      key,
    );
  }

  @override
  Future<void> putItem(ProfileEntity item) async {
    await Hive.box("profile-cahce").put("user-info", item);
  }

  @override
  Future<void> clearAll() async {
    await Hive.box("profile-cahce").clear();
  }

  @override
  Future<void> clearAt(id) {

    throw UnimplementedError();
  }
}
