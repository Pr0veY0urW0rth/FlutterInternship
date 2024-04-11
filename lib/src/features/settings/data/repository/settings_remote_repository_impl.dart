import 'package:intership/src/features/settings/data/datasource/remote/settings_remote_datasource.dart';
import 'package:intership/src/features/settings/domain/repository/settings_remote_repository.dart';

class SettingsRemoteRepositoryImpl extends SettingsRemoteRepository {
  final SettingsRemoteDatasource datasource;

  SettingsRemoteRepositoryImpl(this.datasource);

  @override
  Future<void> logOut() async {
    await datasource.logOut();
  }

  @override
  Future<void> deleteAllData() {
    // TODO: implement deleteAllData
    throw UnimplementedError();
  }
}
