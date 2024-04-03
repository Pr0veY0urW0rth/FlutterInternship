// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:intership/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource datasource;
  AuthRepositoryImpl(
    this.datasource,
  );

  @override
  Future<void> signIn({required String email, required String password}) async {
    datasource.signIn(email: email, password: password);
  }
}
