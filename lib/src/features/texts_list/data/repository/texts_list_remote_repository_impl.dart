// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/features/texts_list/data/datasource/remote/texts_list_remote_datasource.dart';
import 'package:intership/src/features/texts_list/data/models/text.dart';
import 'package:intership/src/features/texts_list/domain/entities/text.dart';
import 'package:intership/src/features/texts_list/domain/repository/texts_list_repository.dart';

class TextsListRemoteRepositoryImpl extends TextsListRemoteRepository {
  TextsListRemoteRepositoryImpl(
    this.datasource,
  );

  TextsListRemoteDatasource datasource;

  @override
  Future<List<TextEntity>> fetchTexts() async {
    List<TextModel> data = await datasource.fetchTexts();
    List<TextEntity> result = [];
    data.forEach((element) => result.add(TextEntity.fromModel(element)));
    return result;
  }
}
