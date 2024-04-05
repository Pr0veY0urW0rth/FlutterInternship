import 'package:intership/src/features/auth/domain/entities/user.dart';

class UserModel extends UserEntity {
  const UserModel({
    String? email,
    String? password,
  }) : super(email: email, password: password);

  factory UserModel.fromEntity(UserEntity user) {
    return UserModel(email: user.email, password: user.password);
  }
}
