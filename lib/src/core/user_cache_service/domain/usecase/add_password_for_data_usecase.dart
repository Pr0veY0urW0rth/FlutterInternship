import 'package:intership/src/core/user_cache_service/domain/repository/storage_service_repository.dart';
import 'package:intership/src/core/utils/usecases/usecase.dart';

class AddPasswordForDataUseCase extends UseCase<void, String> {
  AddPasswordForDataUseCase(
    this.repository,
  );

  StorageServiceRepository repository;
  @override
  Future<void> call({String? params}) async {
    await repository.addPasswordForData(params!);
  }
}
