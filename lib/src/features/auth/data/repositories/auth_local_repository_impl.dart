// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/auth/data/datasources/local/auth_local_datasource.dart';
import 'package:intership/src/features/auth/domain/repositories/auth_local_repository.dart';

class AuthLocalRepositoryImpl extends AuthLocalRepository {
  AuthLocalRepositoryImpl(
    this.datasource,
  );

  AuthLocalDatasource datasource;

  @override
  Future<void> signIn(String userToken) async {
    await datasource.signIn(userToken);
  }
}
