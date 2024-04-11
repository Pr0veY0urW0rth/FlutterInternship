import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/settings/data/datasource/local/settings_hive_datasource.dart';
import 'package:intership/src/features/settings/data/datasource/local/settings_local_datasource.dart';
import 'package:intership/src/features/settings/data/datasource/remote/settings_remote_datasource.dart';
import 'package:intership/src/features/settings/data/datasource/remote/settings_supabase_datasource.dart';
import 'package:intership/src/features/settings/data/repository/settings_local_repository_impl.dart';
import 'package:intership/src/features/settings/data/repository/settings_remote_repository_impl.dart';
import 'package:intership/src/features/settings/domain/repository/settings_local_repository.dart';
import 'package:intership/src/features/settings/domain/repository/settings_remote_repository.dart';
import 'package:intership/src/features/settings/domain/usecases/log_out_usecase.dart';

initSettingsInjections() {
  sl.registerSingleton<SettingsRemoteDatasource>(SettingSupabaseDatasource());
  sl.registerSingleton<SettingsLocalDatasource>(SettingsHiveDatasource());
  sl.registerSingleton<SettingsRemoteRepository>(
      SettingsRemoteRepositoryImpl(sl()));
  sl.registerSingleton<SettingsLocalRepository>(
      SettingsLocalRepositoryImpl(sl()));
  sl.registerSingleton<LogOutUseCase>(LogOutUseCase(sl()));
}
