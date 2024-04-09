import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/text_edit/data/datasource/remote/text_edit_remote_datasource.dart';
import 'package:intership/src/shared/data/models/text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TextEditSupabaseDatasource extends TextEditRemoteDatasource {
  @override
  Future<void> saveTextToSupabase(TextModel text) async {
    final supabase = sl.get<Supabase>().client;
    await supabase
        .from('Texts')
        .update({'header': text.header, 'text': text.text}).match(
            {'id': text.supabaseId});
  }
}
