import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:intership/src/features/auth/data/datasources/remote/auth_supabase_datasource.dart';
import 'package:intership/src/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:intership/src/features/auth/domain/repositories/auth_repository.dart';
import 'package:intership/src/features/auth/domain/usecases/auth_usecas.dart';

initAuthInjections() {
  sl.registerSingleton<AuthRemoteDatasource>(AuthSupabaseDatasource());
  sl.registerSingleton<AuthRepository>(AuthRepositoryImpl(sl()));
  sl.registerSingleton<AuthUseCase>(AuthUseCase(sl()));
}
