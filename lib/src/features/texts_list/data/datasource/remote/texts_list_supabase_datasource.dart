import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/texts_list/data/datasource/remote/texts_list_remote_datasource.dart';
import 'package:intership/src/shared/data/models/text.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class TextsListSupabaseDatasource extends TextsListRemoteDatasource {
  @override
  Future<List<TextModel>> fetchTexts() async {
    final supabase = sl.get<Supabase>().client;
    final data = await supabase.from('Texts').select();
    List<TextModel> result = [];

    data.forEach((e) => result.add(TextModel.fromMap(e)));
    return result;
  }
}
