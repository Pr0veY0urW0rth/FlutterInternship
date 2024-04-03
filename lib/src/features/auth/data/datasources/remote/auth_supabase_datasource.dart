import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupabaseDatasource extends AuthRemoteDatasource {
  @override
  Future<void> signIn({required String email, required String password}) async {
    print("email $email password $password");
    final supabase = sl.get<Supabase>();
    final result = await supabase.client.auth
        .signInWithPassword(email: email, password: password);
    print(result.session?.accessToken);
  }
}
