import 'package:intership/src/core/user_cache_service/data/models/user_cache_model.dart';
import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/auth/data/datasources/remote/auth_remote_datasource.dart';
import 'package:intership/src/features/auth/data/models/user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthSupabaseDatasource extends AuthRemoteDatasource {
  @override
  Future<UserCacheModel> signIn(UserModel user) async {
    final supabase = sl.get<Supabase>().client.auth;
    try {
      await supabase.signInWithPassword(
          email: user.email!, password: user.password!);
      UserCacheModel userModel = UserCacheModel(
          dataPassword: '',
          email: supabase.currentSession!.user.email!,
          isSavingInSupabase: true,
          token: supabase.currentSession!.accessToken.toString(),
          isUsingPassword: false);
      return userModel; // supabase.currentSession!.accessToken.toString();
    } catch (_) {
      throw Exception('Failed to login');
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
