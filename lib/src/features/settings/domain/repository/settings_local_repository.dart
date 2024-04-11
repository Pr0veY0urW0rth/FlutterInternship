abstract class SettingsLocalRepository {
  Future<void> deleteAllData();
  Future<void> logOut();
  Future<void> changeSupabaseOptionality();
  Future<void> addPasswordForData();
  Future<void> removePasswordForData();
}
