// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/features/text_edit/domain/repository/text_edit_local_repository.dart';
import 'package:intership/src/shared/domain/entities/text.dart';

class SaveTextLocalyUseCase extends UseCase<void, TextEntity> {
  SaveTextLocalyUseCase(
    this.repository,
  );

  TextEditLocalRepository repository;

  @override
  Future<void> call({TextEntity? params}) async {
    await repository.saveText(params!);
  }
}
