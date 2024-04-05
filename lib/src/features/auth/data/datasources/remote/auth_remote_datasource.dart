import 'package:intership/src/features/auth/data/models/user.dart';

abstract class AuthRemoteDatasource {
  Future<void> signIn(UserModel user);
  Future<void> signUp(UserModel user);
}
