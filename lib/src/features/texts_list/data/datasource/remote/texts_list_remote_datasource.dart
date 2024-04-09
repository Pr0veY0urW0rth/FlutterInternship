import 'package:intership/src/shared/data/models/text.dart';

abstract class TextsListRemoteDatasource {
  Future<List<TextModel>> fetchTexts();
}
