// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/features/settings/domain/repository/settings_local_repository.dart';
import 'package:intership/src/features/settings/domain/repository/settings_remote_repository.dart';

class DeleteAllLocalDataUseCase extends UseCase<void, void> {
  SettingsLocalRepository repository;
  DeleteAllLocalDataUseCase(
    this.repository,
  );

  @override
  Future<void> call({void params}) async {
    await repository.deleteAllData();
  }
}

class DeleteAllRemoteDataUseCase extends UseCase<void, void> {
  SettingsRemoteRepository repository;
  DeleteAllRemoteDataUseCase(
    this.repository,
  );

  @override
  Future<void> call({void params}) async {
    await repository.deleteAllData();
  }
}
