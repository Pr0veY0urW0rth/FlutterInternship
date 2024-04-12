import 'package:intership/src/core/user_cache_service/domain/repository/storage_service_repository.dart';
import 'package:intership/src/core/utils/usecases/usecase.dart';

class ChangeSupabaseOptionalityUseCase extends UseCase<void, void> {
  ChangeSupabaseOptionalityUseCase(
    this.repository,
  );

  StorageServiceRepository repository;
  @override
  Future<void> call({void params}) async {
    await repository.changeSupabaseOptionality();
  }
}
