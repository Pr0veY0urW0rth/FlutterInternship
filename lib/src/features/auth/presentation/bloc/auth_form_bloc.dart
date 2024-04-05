// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intership/src/core/utils/constants/auth_enums.dart';
import 'package:intership/src/features/auth/domain/entities/user.dart';

import 'package:intership/src/features/auth/domain/entities/formz/email.dart';
import 'package:intership/src/features/auth/domain/entities/formz/password.dart';
import 'package:intership/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:intership/src/features/auth/domain/usecases/sign_up_usecase.dart';

part 'auth_form_event.dart';
part 'auth_form_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc({
    required SignUpUseCase signUpUseCase,
    required SignInUseCase signInUseCase,
  })  : _signInUsecase = signInUseCase,
        _signUpUseCase = signUpUseCase,
        super(const AuthState()) {
    on<AuthEmailChanged>(_onEmailChanged);
    on<AuthPasswordChanged>(_onPasswordChanged);
    on<SignInSubmitted>(_onSignInSubmitted);
    on<SignUpSubmitted>(_onSignUpSubmitted);
    on<AuthTypeChanged>(_onAuthTypeChanged);
    on<PasswordVisibilityChanged>(_onPasswordVisibilityChanged);
  }

  final SignInUseCase _signInUsecase;
  final SignUpUseCase _signUpUseCase;

  void _onEmailChanged(AuthEmailChanged event, Emitter<AuthState> emit) {
    final email = Email.dirty(event.email);
    emit(state.copyWith(
      email: email,
      isValid: Formz.validate([state.password, email]),
    ));
  }

  void _onPasswordChanged(AuthPasswordChanged event, Emitter<AuthState> emit) {
    final password = Password.dirty(event.password);
    emit(state.copyWith(
      password: password,
      isValid: Formz.validate([password, state.email]),
    ));
  }

  void _onPasswordVisibilityChanged(
      PasswordVisibilityChanged event, Emitter<AuthState> emit) {
    emit(state.copyWith(isPasswordVisible: !state.isPasswordVisible));
  }

  Future<void> _onSignInSubmitted(
      SignInSubmitted event, Emitter<AuthState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final user = UserEntity(
            email: state.email.value, password: state.password.value);
        await _signInUsecase.call(params: user);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  Future<void> _onSignUpSubmitted(
      SignUpSubmitted event, Emitter<AuthState> emit) async {
    if (state.isValid) {
      emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
      try {
        final user = UserEntity(
            email: state.email.value, password: state.password.value);
        await _signUpUseCase.call(params: user);
        emit(state.copyWith(status: FormzSubmissionStatus.success));
      } catch (_) {
        emit(state.copyWith(status: FormzSubmissionStatus.failure));
      }
    }
  }

  void _onAuthTypeChanged(AuthTypeChanged event, Emitter<AuthState> emit) {
    if (state.type == AuthType.signIn) {
      emit(state.copyWith(type: AuthType.signUp));
    } else {
      emit(state.copyWith(type: AuthType.signIn));
    }
  }
}
