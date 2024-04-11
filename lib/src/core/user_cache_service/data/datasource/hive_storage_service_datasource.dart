import 'package:hive/hive.dart';
import 'package:intership/src/core/user_cache_service/data/datasource/storage_service_datasource.dart';
import 'package:intership/src/core/user_cache_service/data/models/user_cache_model.dart';
import 'package:intership/src/core/utils/constants/hive_boxes.dart';
import 'package:intership/src/core/utils/constants/hive_keys.dart';

class HiveStorageServiceDatasource extends StorageServiceDatasource {
  @override
  Future<void> addPasswordForData(String password) async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    final UserCacheModel user = await box.get(userKey).cast<UserCacheModel>();
    await box.put(
        userKey, user.copyWith(dataPassword: password, isUsingPassword: true));
  }

  @override
  Future<void> changeSupabaseOptionality() async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    final UserCacheModel user = await box.get(userKey).cast<UserCacheModel>();
    await box.put(
        userKey, user.copyWith(isSavingInSupabase: !user.isSavingInSupabase));
  }

  @override
  Future<void> removePasswordForData() async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    final UserCacheModel user = await box.get(userKey).cast<UserCacheModel>();
    await box.put(
        userKey, user.copyWith(dataPassword: '', isUsingPassword: false));
  }

  @override
  Future<void> logOut() async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    await box.deleteAll([userKey, textsListKey]);
  }

  @override
  Future<bool> isUserLoggedIn() async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    return box.containsKey(userKey);
  }

  @override
  Future<bool> isUsingPassword() async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    final UserCacheModel user = await box.get(userKey).cast<UserCacheModel>();
    return user.isUsingPassword;
  }

  @override
  Future<bool> isUsingSupabase() async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    final UserCacheModel user = await box.get(userKey).cast<UserCacheModel>();
    return user.isSavingInSupabase;
  }

  @override
  Future<void> saveUser(UserCacheModel user) async {
    await Hive.openBox(userBox);
    var box = Hive.box(userBox);
    await box.put(userKey, user);
  }
}
