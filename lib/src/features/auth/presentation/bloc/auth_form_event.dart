part of 'auth_form_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AuthEmailChanged extends AuthEvent {
  const AuthEmailChanged(this.email);

  final String email;

  @override
  List<Object> get props => [email];
}

class AuthPasswordChanged extends AuthEvent {
  const AuthPasswordChanged(this.password);

  final String password;

  @override
  List<Object> get props => [password];
}

class PasswordVisibilityChanged extends AuthEvent {
  const PasswordVisibilityChanged();
}

class SignInSubmitted extends AuthEvent {
  const SignInSubmitted();
}

class SignUpSubmitted extends AuthEvent {
  const SignUpSubmitted();
}

class AuthTypeChanged extends AuthEvent {
  const AuthTypeChanged();
}
