// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_form_bloc.dart';

final class AuthState extends Equatable {
  const AuthState({
    this.status = FormzSubmissionStatus.initial,
    this.email = const Email.pure(),
    this.password = const Password.pure(),
    this.isPasswordVisible = false,
    this.isValid = false,
    this.type = AuthType.signIn,
  });

  final FormzSubmissionStatus status;
  final Email email;
  final Password password;
  final bool isValid;
  final bool isPasswordVisible;
  final AuthType type;

  AuthState copyWith(
      {FormzSubmissionStatus? status,
      Email? email,
      Password? password,
      bool? isValid,
      bool? isPasswordVisible,
      AuthType? type}) {
    return AuthState(
      status: status ?? this.status,
      email: email ?? this.email,
      password: password ?? this.password,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isValid: isValid ?? this.isValid,
      type: type ?? this.type,
    );
  }

  @override
  List<Object> get props => [status, email, password, isPasswordVisible, type];
}
