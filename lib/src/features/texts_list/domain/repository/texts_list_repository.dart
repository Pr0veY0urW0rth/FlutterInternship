import 'package:intership/src/features/texts_list/domain/entities/text.dart';

abstract class TextsListRepository {
  Future<List<TextEntity>> getSavedTexts();
  Future<void> saveText(TextEntity text);
  Future<void> saveTextsList(List<TextEntity> list);
  Future<void> editSavedText(TextEntity text);
}
