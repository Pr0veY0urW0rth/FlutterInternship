// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:intership/src/core/utils/usecases/usecase.dart';
import 'package:intership/src/features/auth/domain/entities/user.dart';
import 'package:intership/src/features/auth/domain/repositories/auth_repository.dart';

class SignInUseCase extends UseCase<void, UserEntity> {
  SignInUseCase(this.authRepositoryImpl);

  final AuthRepository authRepositoryImpl;

  @override
  Future<void> call({UserEntity? params}) async {
    return await authRepositoryImpl.signIn(params!);
  }
}
