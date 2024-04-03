abstract class AuthRemoteDatasource {
  Future<void> signIn({required String email, required String password});
}
