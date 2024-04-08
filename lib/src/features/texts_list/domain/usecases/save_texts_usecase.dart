import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/features/texts_list/domain/entities/text.dart';
import 'package:intership/src/features/texts_list/domain/repository/texts_list_repository.dart';

class SaveTextsUseCase extends UseCase<void, List<TextEntity>> {
  TextsListLocalRepository repository;
  SaveTextsUseCase(
    this.repository,
  );
  @override
  Future<void> call({List<TextEntity>? params}) async {
    return await repository.saveTextsList(params!);
  }
}
