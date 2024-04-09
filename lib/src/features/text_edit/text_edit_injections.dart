import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/text_edit/data/datasource/local/text_edit_hive_datasource.dart';
import 'package:intership/src/features/text_edit/data/datasource/local/text_edit_local_datasource.dart';
import 'package:intership/src/features/text_edit/data/datasource/remote/text_edit_remote_datasource.dart';
import 'package:intership/src/features/text_edit/data/datasource/remote/text_edit_supabase_datasource.dart';
import 'package:intership/src/features/text_edit/data/repository/text_edit_local_repository_impl.dart';
import 'package:intership/src/features/text_edit/data/repository/text_edit_remote_repository_impl.dart';
import 'package:intership/src/features/text_edit/domain/repository/text_edit_local_repository.dart';
import 'package:intership/src/features/text_edit/domain/repository/text_edit_remote_repository.dart';
import 'package:intership/src/features/text_edit/domain/usecases/get_text_by_id_usecase.dart';
import 'package:intership/src/features/text_edit/domain/usecases/save_text_localy_usecase.dart';
import 'package:intership/src/features/text_edit/domain/usecases/save_text_remotely_usecase.dart';

initTextEditInjections() {
  sl.registerSingleton<TextEditLocalDatasource>(TextEditHiveDatasource());
  sl.registerSingleton<TextEditRemoteDatasource>(TextEditSupabaseDatasource());
  sl.registerSingleton<TextEditLocalRepository>(
      TextEditLocalRepositoryImpl(sl()));
  sl.registerSingleton<TextEditRemoteRepository>(
      TextEditRemoteRepositoryImpl(sl()));
  sl.registerSingleton<GetTextByIdUseCase>(GetTextByIdUseCase(sl()));
  sl.registerSingleton<SaveTextLocalyUseCase>(SaveTextLocalyUseCase(sl()));
  sl.registerSingleton<SaveTextRemotelyUseCase>(SaveTextRemotelyUseCase(sl()));
}
