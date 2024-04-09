import 'package:hive/hive.dart';
import 'package:intership/src/core/utils/constants/hive_boxes.dart';
import 'package:intership/src/core/utils/constants/hive_keys.dart';
import 'package:intership/src/features/text_edit/data/datasource/local/text_edit_local_datasource.dart';
import 'package:intership/src/shared/data/models/text.dart';

class TextEditHiveDatasource extends TextEditLocalDatasource {
  @override
  Future<TextModel> getSavedText(int id) async {
    await Hive.openBox(textsBox);
    var box = Hive.box(textsBox);
    List<TextModel> list =
        await box.get(textsListKey, defaultValue: []).cast<TextModel>();
    return list.firstWhere((element) => element.supabaseId == id);
  }

  @override
  Future<void> saveText(TextModel text) async {
    await Hive.openBox(textsBox);
    var box = Hive.box(textsBox);
    List<TextModel> list =
        await box.get(textsListKey, defaultValue: []).cast<TextModel>();
    List<TextModel> new_list = [];
    list.forEach((element) {
      if (element.supabaseId == text.supabaseId) {
        new_list.add(TextModel(
            header: text.header, text: text.text, supabaseId: text.supabaseId));
      } else {
        new_list.add(element);
      }
    });

    await box.put(textsListKey, new_list);
  }
}
