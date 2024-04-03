// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/auth/domain/repositories/auth_repository.dart';

class AuthUseCase {
  final AuthRepository authRepositoryImpl;
  AuthUseCase(
    this.authRepositoryImpl,
  );
  Future<void> call({required String email, required String password}) async {
    return await authRepositoryImpl.signIn(email: email, password: password);
  }
}
