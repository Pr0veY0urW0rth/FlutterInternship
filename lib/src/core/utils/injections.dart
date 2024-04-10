import 'package:get_it/get_it.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:intership/src/core/utils/constants/supabase_constants.dart';
import 'package:intership/src/features/auth/auth_injections.dart';
import 'package:intership/src/features/settings/settings_injections.dart';
import 'package:intership/src/features/text_create/text_create_injections.dart';
import 'package:intership/src/features/text_details/text_details_injections.dart';
import 'package:intership/src/features/text_edit/text_edit_injections.dart';
import 'package:intership/src/shared/data/models/text.dart';
import 'package:intership/src/features/texts_list/texts_list_injections.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

final sl = GetIt.instance;

Future<void> initInjections() async {
  await initSupabaseInjections();
  initRouterInjections();
  initAuthInjections();
  initSettingsInjections();
  initHiveDatabase();
  initTextsListInjections();
  initTextDetailsInjections();
  initTextEditInjections();
  initTextCreateInjections();
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
