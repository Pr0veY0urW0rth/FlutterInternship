import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/texts_list/data/datasource/local/texts_list_hive_datasource.dart';
import 'package:intership/src/features/texts_list/data/datasource/local/texts_list_local_datasource.dart';
import 'package:intership/src/features/texts_list/data/datasource/remote/texts_list_remote_datasource.dart';
import 'package:intership/src/features/texts_list/data/datasource/remote/texts_list_supabase_datasource.dart';
import 'package:intership/src/features/texts_list/data/repository/texts_list_local_repository_impl.dart';
import 'package:intership/src/features/texts_list/data/repository/texts_list_remote_repository_impl.dart';
import 'package:intership/src/features/texts_list/domain/repository/texts_list_repository.dart';
import 'package:intership/src/features/texts_list/domain/usecases/fetch_texts_usecase.dart';
import 'package:intership/src/features/texts_list/domain/usecases/get_saved_texts_usecase.dart';
import 'package:intership/src/features/texts_list/domain/usecases/save_texts_usecase.dart';

initTextsListInjections() {
  sl.registerSingleton<TextsListRemoteDatasource>(
      TextsListSupabaseDatasource());
  sl.registerSingleton<TextsListLocalDatasource>(TextsListHiveDatasource());
  sl.registerSingleton<TextsListRemoteRepository>(
      TextsListRemoteRepositoryImpl(sl()));
  sl.registerSingleton<TextsListLocalRepository>(
      TextsListLocalRepositoryImpl(sl()));
  sl.registerSingleton<FetchTextsUseCase>(FetchTextsUseCase(sl()));
  sl.registerSingleton<SaveTextsUseCase>(SaveTextsUseCase(sl()));
  sl.registerSingleton<GetSavedTextsUseCase>(GetSavedTextsUseCase(sl()));
}
