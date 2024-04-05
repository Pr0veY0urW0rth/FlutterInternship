// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/texts_list/data/datasource/local/texts_list_local_datasource.dart';
import 'package:intership/src/features/texts_list/data/models/text.dart';
import 'package:intership/src/features/texts_list/domain/entities/text.dart';
import 'package:intership/src/features/texts_list/domain/repository/texts_list_repository.dart';

class TextsListRepositoryImpl extends TextsListRepository {
  TextsListLocalDatasource datasource;
  TextsListRepositoryImpl(
    this.datasource,
  );

  @override
  Future<void> editSavedText(TextEntity text) async {
    await datasource.editSavedText(TextModel.fromEntity(text));
  }

  @override
  Future<List<TextEntity>> getSavedTexts() async {
    var list = await datasource.getSavedTexts();
    List<TextEntity> entitiesList = [];
    list.forEach((element) {
      entitiesList.add(TextEntity.fromModel(element));
    });
    return entitiesList;
  }

  @override
  Future<void> saveText(TextEntity text) async {
    await datasource.saveText(TextModel.fromEntity(text));
  }

  @override
  Future<void> saveTextsList(List<TextEntity> list) async {
    List<TextModel> modelsList = [];
    list.forEach((element) {
      modelsList.add(TextModel.fromEntity(element));
    });
    await datasource.saveTextsList(modelsList);
  }
}