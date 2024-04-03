part of 'auth_form_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object?> get props => [];
}

class AppStarted extends AuthEvent {}

class AuthEmailChanged extends AuthEvent {
  final String email;

  const AuthEmailChanged(this.email);
  @override
  List<Object> get props => [email];
}

class AuthPasswordChanged extends AuthEvent {
  final String password;

  const AuthPasswordChanged(this.password);
  @override
  List<Object> get props => [password];
}

class AuthSubmitted extends AuthEvent {
  const AuthSubmitted();
}
