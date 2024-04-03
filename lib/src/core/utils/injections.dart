import 'package:get_it/get_it.dart';
import 'package:intership/src/core/utils/constants/supabase_constants.dart';
import 'package:intership/src/features/auth/auth_injections.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  initSupdabaseInjections();
  initRouterInjections();
  initAuthInjections();
}

initSupdabaseInjections() async {
  final supabaseInstance =
      await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  sl.registerSingleton(supabaseInstance);
}

initRouterInjections() {}
