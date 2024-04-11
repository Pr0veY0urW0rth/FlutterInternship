// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/core/user_cache_service/domain/entities/user_cache_entity.dart';
import 'package:intership/src/core/user_cache_service/domain/repository/storage_service_repository.dart';
import 'package:intership/src/core/utils/usecases/usecase.dart';

class SaveUserUseCase extends UseCase<void, UserCacheEntity> {
  SaveUserUseCase(
    this.repository,
  );

  StorageServiceRepository repository;

  @override
  Future<void> call({UserCacheEntity? params}) async {
    await repository.saveUser(params!);
  }
}
