import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:intership/src/features/auth/data/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupabaseDatasource extends AuthRemoteDatasource {
  @override
  Future<void> signIn(UserModel user) async {
    final supabase = sl.get<Supabase>().client.auth;
    try {
      await supabase.signInWithPassword(
          email: user.email!, password: user.password!);
    } catch (_) {
      return;
    }
  }

  @override
  Future<void> signUp(UserModel user) async {
    final supabase = sl.get<Supabase>().client.auth;
    try {
      await supabase.signUp(email: user.email!, password: user.password!);
    } catch (_) {
      return;
    }
  }
}
