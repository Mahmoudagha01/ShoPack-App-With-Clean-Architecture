abstract class CacheManagerBase<T> {
  Future<void> init();
  void registerAdapter();
  Future<void> addItem(T item);
  Future<void> putItem(T item);
  T? getItem(String key);
  Future<void> clearAll();
  Future<void> clearAt(int id);
}
