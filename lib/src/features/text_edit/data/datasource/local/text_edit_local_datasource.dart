import 'package:intership/src/shared/data/models/text.dart';

abstract class TextEditLocalDatasource {
  Future<TextModel> getSavedText(int id);
  Future<void> saveText(TextModel text);
}
