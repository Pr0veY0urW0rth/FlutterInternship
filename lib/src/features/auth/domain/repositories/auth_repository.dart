import 'package:intership/src/features/auth/domain/entities/user.dart';

abstract class AuthRepository {
  Future<void> signIn(UserEntity user);
  Future<void> signUp(UserEntity user);
}
