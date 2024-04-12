import 'package:intership/src/core/user_cache_service/data/datasource/hive_storage_service_datasource.dart';
import 'package:intership/src/core/user_cache_service/data/datasource/storage_service_datasource.dart';
import 'package:intership/src/core/user_cache_service/data/repository/storage_service_repository_impl.dart';
import 'package:intership/src/core/user_cache_service/domain/repository/storage_service_repository.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/add_password_for_data_usecase.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/change_supabase_optionality_usecase.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/log_out_usecase.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/remove_password_for_data_usecase.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/save_user_usecase.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/user_login_check_usecase.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/user_password_check_usecase.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/user_supabase_check_usecase.dart';
import 'package:intership/src/core/utils/injections.dart';

initUserCacheServiceInjections() {
  sl.registerSingleton<StorageServiceDatasource>(
      HiveStorageServiceDatasource());
  sl.registerSingleton<StorageServiceRepository>(
      StorageServiceRepositoryImpl(sl()));
  sl.registerSingleton<AddPasswordForDataUseCase>(
      AddPasswordForDataUseCase(sl()));
  sl.registerSingleton<ChangeSupabaseOptionalityUseCase>(
      ChangeSupabaseOptionalityUseCase(sl()));
  sl.registerSingleton<LogOutUseCase>(LogOutUseCase(sl()));
  sl.registerSingleton<RemovePasswordForDataUseCase>(
      RemovePasswordForDataUseCase(sl()));
  sl.registerSingleton<SaveUserUseCase>(SaveUserUseCase(sl()));
  sl.registerSingleton<UserLoginCheckUseCase>(UserLoginCheckUseCase(sl()));
  sl.registerSingleton<UserPasswordCheckUseCase>(
      UserPasswordCheckUseCase(sl()));
  sl.registerSingleton<UserSupabaseCheckUseCase>(
      UserSupabaseCheckUseCase(sl()));
}
