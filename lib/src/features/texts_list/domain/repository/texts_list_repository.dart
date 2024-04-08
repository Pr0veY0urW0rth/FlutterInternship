import 'package:intership/src/features/texts_list/domain/entities/text.dart';

abstract class TextsListLocalRepository {
  Future<List<TextEntity>> getSavedTexts();
  Future<void> saveTextsList(List<TextEntity> list);
}

abstract class TextsListRemoteRepository {
  Future<List<TextEntity>> fetchTexts();
}
