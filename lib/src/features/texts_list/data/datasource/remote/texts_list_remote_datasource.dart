import 'package:intership/src/features/texts_list/data/models/text.dart';

abstract class TextsListRemoteDatasource {
  Future<List<TextModel>> fetchTexts();
}
