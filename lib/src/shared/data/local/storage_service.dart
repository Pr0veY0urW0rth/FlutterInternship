abstract class StorageService {
  void init();

  Future<bool> add(String key, String data);

  Future<List<Object>> getAll(String key);

  Future<bool> change(String key, String data);
}
