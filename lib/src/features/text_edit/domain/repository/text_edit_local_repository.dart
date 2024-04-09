import 'package:intership/src/shared/domain/entities/text.dart';

abstract class TextEditLocalRepository {
  Future<TextEntity> getSavedText(int id);
  Future<void> saveText(TextEntity text);
}
