// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:intership/src/features/auth/data/models/user.dart';
import 'package:intership/src/features/auth/domain/entities/user.dart';
import 'package:intership/src/features/auth/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl extends AuthRepository {
  final AuthRemoteDatasource datasource;
  AuthRepositoryImpl(
    this.datasource,
  );

  @override
  Future<void> signUp(UserEntity user) async {
    await datasource.signUp(UserModel.fromEntity(user));
  }

  @override
  Future<void> signIn(UserEntity user) async {
    await datasource.signIn(UserModel.fromEntity(user));
  }
}
