// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/core/user_cache_service/domain/entities/user_cache_entity.dart';
import 'package:intership/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:intership/src/features/auth/data/models/user.dart';
import 'package:intership/src/features/auth/domain/entities/user.dart';
import 'package:intership/src/features/auth/domain/repositories/auth_remote_repository.dart';

class AuthRemoteRepositoryImpl extends AuthRemoteRepository {
  final AuthRemoteDatasource datasource;
  AuthRemoteRepositoryImpl(
    this.datasource,
  );

  @override
  Future<void> signUp(UserEntity user) async {
    await datasource.signUp(UserModel.fromEntity(user));
  }

  @override
  Future<UserCacheEntity> signIn(UserEntity user) async {
    final model = await datasource.signIn(UserModel.fromEntity(user));

    return UserCacheEntity.fromModel(model);
  }
}
