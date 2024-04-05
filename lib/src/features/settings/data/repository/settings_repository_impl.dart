import 'package:intership/src/features/settings/data/datasource/remote/settings_remote_datasource.dart';
import 'package:intership/src/features/settings/domain/repository/settings_repository.dart';

class SettingsRepositoryImpl extends SettingsRepository {
  final SettingsRemoteDatasource datasource;

  SettingsRepositoryImpl(this.datasource);

  @override
  Future<void> logOut() async {
    await datasource.logOut();
  }
}
