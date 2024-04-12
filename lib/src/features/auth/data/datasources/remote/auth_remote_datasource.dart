import 'package:intership/src/features/auth/data/models/user.dart';
import 'package:intership/src/core/user_cache_service/data/models/user_cache_model.dart';

abstract class AuthRemoteDatasource {
  Future<UserCacheModel> signIn(UserModel user);
  Future<void> signUp(UserModel user);
}
