// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/settings/data/datasource/local/settings_local_datasource.dart';
import 'package:intership/src/features/settings/domain/repository/settings_local_repository.dart';

class SettingsLocalRepositoryImpl extends SettingsLocalRepository {
  SettingsLocalRepositoryImpl(
    this.datasource,
  );

  SettingsLocalDatasource datasource;

  @override
  Future<void> addPasswordForData() {
    // TODO: implement addPasswordForData
    throw UnimplementedError();
  }

  @override
  Future<void> changeSupabaseOptionality() {
    // TODO: implement changeSupabaseOptionality
    throw UnimplementedError();
  }

  @override
  Future<void> deleteAllData() {
    // TODO: implement deleteAllData
    throw UnimplementedError();
  }

  @override
  Future<void> logOut() {
    // TODO: implement logOut
    throw UnimplementedError();
  }

  @override
  Future<void> removePasswordForData() {
    // TODO: implement removePasswordForData
    throw UnimplementedError();
  }
}
