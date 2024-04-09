import 'package:intership/src/shared/data/models/text.dart';

abstract class TextEditRemoteDatasource {
  Future<void> saveTextToSupabase(TextModel text);
}
