import 'package:intership/src/core/user_cache_service/domain/entities/user_cache_entity.dart';
import 'package:intership/src/features/auth/domain/entities/user.dart';

abstract class AuthRemoteRepository {
  Future<UserCacheEntity> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
}
