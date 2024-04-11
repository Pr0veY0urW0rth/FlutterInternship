import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/settings/data/datasource/remote/settings_remote_datasource.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SettingSupabaseDatasource extends SettingsRemoteDatasource {
  @override
  Future<void> logOut() async {
    final supabase = sl.get<Supabase>().client.auth;
    try {
      await supabase.signOut();
    } catch (_) {
      return;
    }
  }

  @override
  Future<void> deleteAllData() {
    // TODO: implement deleteAllData
    throw UnimplementedError();
  }
}
