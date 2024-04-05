import 'package:hive/hive.dart';
import 'package:intership/src/core/utils/constants/hive_keys.dart';
import 'package:intership/src/features/texts_list/data/datasource/local/texts_list_local_datasource.dart';
import 'package:intership/src/features/texts_list/data/models/text.dart';

class TextsListHiveDatasource extends TextsListLocalDatasource {
  @override
  Future<List<TextModel>> getSavedTexts() async {
    await Hive.openBox('textsListBox');
    var box = Hive.box('textsListBox');
    return await box.get(textsListKey, defaultValue: []).cast<TextModel>();
  }

  @override
  Future<void> saveText(TextModel text) async {
    await Hive.openBox('textsListBox');
    var box = Hive.box('textsListBox');
    var list = box.get(textsListKey, defaultValue: []);
    list.add(text);
    await box.put(textsListKey, list);
  }

  @override
  Future<void> saveTextsList(List<TextModel> list) async {
    await Hive.openBox('textsListBox');
    var box = Hive.box('textsListBox');
    await box.put(textsListKey, list);
  }

  @override
  Future<void> editSavedText(TextModel text) async {}
}
