import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intership/src/core/utils/constants/supabase_constants.dart';
import 'package:intership/src/features/auth/auth_injections.dart';
import 'package:intership/src/features/settings/settings_injections.dart';
import 'package:intership/src/features/texts_list/data/models/text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSupabaseInjections();
  initRouterInjections();
  initAuthInjections();
  initSettingsInjections();
  initHiveDatabase();
}

initSupabaseInjections() async {
  final supabaseInstance =
      await Supabase.initialize(url: supabaseUrl, anonKey: supabaseAnonKey);
  sl.registerSingleton(supabaseInstance);
}

initRouterInjections() {
  //AppRouter.instance;
}

initHiveDatabase() async {
  await Hive.initFlutter();
  Hive.registerAdapter(TextModelAdapter());
}
