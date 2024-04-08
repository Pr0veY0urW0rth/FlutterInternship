import 'package:intership/src/features/auth/domain/entities/user.dart';

abstract class AuthRemoteRepository {
  Future<String> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
}
