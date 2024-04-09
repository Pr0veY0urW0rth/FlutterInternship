import 'package:intership/src/shared/domain/entities/text.dart';

abstract class TextsListLocalRepository {
  Future<List<TextEntity>> getSavedTexts();
  Future<void> saveTextsList(List<TextEntity> list);
}

abstract class TextsListRemoteRepository {
  Future<List<TextEntity>> fetchTexts();
}
