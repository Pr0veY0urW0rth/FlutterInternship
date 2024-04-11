import 'package:intership/src/core/user_cache_service/data/datasource/hive_storage_service_datasource.dart';
import 'package:intership/src/core/user_cache_service/data/datasource/storage_service_datasource.dart';
import 'package:intership/src/core/user_cache_service/data/repository/storage_service_repository_impl.dart';
import 'package:intership/src/core/user_cache_service/domain/repository/storage_service_repository.dart';
import 'package:intership/src/core/utils/injections.dart';

initUserCacheServiceInjections() {
  sl.registerSingleton<StorageServiceDatasource>(
      HiveStorageServiceDatasource());

  sl.registerSingleton<StorageServiceRepository>(
      StorageServiceRepositoryImpl(sl()));
}
