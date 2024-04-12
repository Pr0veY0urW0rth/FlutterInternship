import 'package:intership/src/core/user_cache_service/domain/repository/storage_service_repository.dart';
import 'package:intership/src/core/utils/usecases/usecase.dart';

class UserLoginCheckUseCase extends UseCase<bool, void> {
  UserLoginCheckUseCase(
    this.repository,
  );

  StorageServiceRepository repository;
  @override
  Future<bool> call({void params}) async {
    return await repository.isUserLoggedIn();
  }
}
