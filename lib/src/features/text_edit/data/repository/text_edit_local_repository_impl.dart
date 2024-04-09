// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/text_edit/data/datasource/local/text_edit_local_datasource.dart';
import 'package:intership/src/features/text_edit/domain/repository/text_edit_local_repository.dart';
import 'package:intership/src/shared/data/models/text.dart';
import 'package:intership/src/shared/domain/entities/text.dart';

class TextEditLocalRepositoryImpl extends TextEditLocalRepository {
  TextEditLocalRepositoryImpl(
    this.datasource,
  );

  TextEditLocalDatasource datasource;

  @override
  Future<TextEntity> getSavedText(int id) async {
    final model = await datasource.getSavedText(id);
    return TextEntity.fromModel(model);
  }

  @override
  Future<void> saveText(TextEntity text) async {
    await datasource.saveText(TextModel.fromEntity(text));
  }
}
