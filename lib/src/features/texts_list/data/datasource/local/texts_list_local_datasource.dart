import 'package:intership/src/shared/data/models/text.dart';

abstract class TextsListLocalDatasource {
  Future<List<TextModel>> getSavedTexts();
  Future<void> saveTextsList(List<TextModel> list);
}
