// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/shared/domain/entities/text.dart';
import 'package:intership/src/features/texts_list/domain/repository/texts_list_repository.dart';

class FetchTextsUseCase extends UseCase<List<TextEntity>, void> {
  TextsListRemoteRepository repository;
  FetchTextsUseCase(
    this.repository,
  );

  @override
  Future<List<TextEntity>> call({void params}) async {
    return await repository.fetchTexts();
  }
}
