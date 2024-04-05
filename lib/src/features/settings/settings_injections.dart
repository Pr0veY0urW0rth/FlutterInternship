import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/settings/data/datasource/remote/settings_remote_datasource.dart';
import 'package:intership/src/features/settings/data/datasource/remote/settings_supabase_datasource.dart';
import 'package:intership/src/features/settings/data/repository/settings_repository_impl.dart';
import 'package:intership/src/features/settings/domain/repository/settings_repository.dart';
import 'package:intership/src/features/settings/domain/usecases/log_out_usecase.dart';

initSettingsInjections() {
  sl.registerSingleton<SettingsRemoteDatasource>(SettingSupabaseDatasource());
  sl.registerSingleton<SettingsRepository>(SettingsRepositoryImpl(sl()));
  sl.registerSingleton<LogOutUseCase>(LogOutUseCase(sl()));
}
