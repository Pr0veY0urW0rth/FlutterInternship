import 'package:intership/src/core/user_cache_service/data/models/user_cache_model.dart';

abstract class StorageServiceDatasource {
  Future<void> changeSupabaseOptionality(); //
  Future<void> addPasswordForData(String password); //
  Future<void> removePasswordForData(); //
  Future<void> logOut(); //
  Future<bool> isUserLoggedIn(); //
  Future<bool> isUsingSupabase();
  Future<bool> isUsingPassword();
  Future<void> saveUser(UserCacheModel user); //
}
