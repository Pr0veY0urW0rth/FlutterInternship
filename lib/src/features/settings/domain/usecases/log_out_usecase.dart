// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/features/settings/domain/repository/settings_repository.dart';

class LogOutUseCase extends UseCase<void, void> {
  SettingsRepository repository;
  LogOutUseCase(
    this.repository,
  );

  @override
  Future<void> call({void params}) async {
    await repository.logOut();
  }
}
