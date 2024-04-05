import 'package:intership/src/features/texts_list/data/models/text.dart';

abstract class TextsListLocalDatasource {
  Future<List<TextModel>> getSavedTexts();
  Future<void> saveText(TextModel text);
  Future<void> saveTextsList(List<TextModel> list);
  Future<void> editSavedText(TextModel text);
}
