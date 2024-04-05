import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/features/texts_list/domain/entities/text.dart';
import 'package:intership/src/features/texts_list/domain/repository/texts_list_repository.dart';

class SaveTextUseCase extends UseCase<void, TextEntity> {
  TextsListRepository repository;
  SaveTextUseCase(
    this.repository,
  );
  @override
  Future<void> call({TextEntity? params}) async {
    return await repository.saveText(params!);
  }
}
