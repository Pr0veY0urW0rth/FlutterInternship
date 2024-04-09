import 'package:intership/src/shared/domain/entities/text.dart';

abstract class TextEditRemoteRepository {
  Future<void> saveTextToSupabase(TextEntity text);
}
