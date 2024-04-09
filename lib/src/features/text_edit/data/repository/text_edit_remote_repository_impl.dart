// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/text_edit/data/datasource/remote/text_edit_remote_datasource.dart';
import 'package:intership/src/features/text_edit/domain/repository/text_edit_remote_repository.dart';
import 'package:intership/src/shared/data/models/text.dart';
import 'package:intership/src/shared/domain/entities/text.dart';

class TextEditRemoteRepositoryImpl extends TextEditRemoteRepository {
  TextEditRemoteRepositoryImpl(
    this.datasource,
  );

  TextEditRemoteDatasource datasource;

  @override
  Future<void> saveTextToSupabase(TextEntity text) async {
    await datasource.saveTextToSupabase(TextModel.fromEntity(text));
  }
}
