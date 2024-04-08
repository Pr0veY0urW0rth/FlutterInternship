import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/core/utils/constants/auth_enums.dart';
import 'package:intership/src/features/auth/presentation/bloc/auth_form_bloc.dart';
import 'package:intership/src/features/auth/presentation/widgets/auth_button.dart';
import 'package:intership/src/features/auth/presentation/widgets/auth_text_field.dart';

class AuthForm extends StatelessWidget {
  const AuthForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) {
        if (state.status.isFailure) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(
              const SnackBar(content: Text('Ошибка входа')),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            _EmailInput(),
            _PasswordInput(),
            _AuthButton(),
            _AuthLink()
          ],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            previous.email != current.email || previous.type != current.type,
        builder: (context, state) {
          return AuthTextField(
            label: 'E-mail',
            onChanged: (email) =>
                context.read<AuthBloc>().add(AuthEmailChanged(email)),
            hintText: 'Введите электронную почту',
            suffixIcon: const Icon(Icons.person_outline_rounded),
            errorText:
                state.email.displayError != null ? 'Неверная почта!' : null,
          );
        });
  }
}

class _PasswordInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) =>
            previous.password != current.password ||
            previous.isPasswordVisible != current.isPasswordVisible ||
            previous.type != current.type,
        builder: (context, state) {
          return AuthTextField(
            label: 'Пароль',
            onChanged: (password) =>
                context.read<AuthBloc>().add(AuthPasswordChanged(password)),
            hintText: 'Введите пароль',
            suffixIcon: Padding(
              padding: const EdgeInsets.all(1),
              child: GestureDetector(
                onTap: () => context
                    .read<AuthBloc>()
                    .add(const PasswordVisibilityChanged()),
                child: Icon(state.isPasswordVisible
                    ? Icons.visibility_rounded
                    : Icons.visibility_off_rounded),
              ),
            ),
            obscureText: !state.isPasswordVisible,
            errorText:
                state.password.displayError != null ? 'Неверный пароль!' : null,
          );
        });
  }
}

class _AuthButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
      if (state.status == FormzSubmissionStatus.success &&
          state.type == AuthType.signIn) {
        context.go(AppRouter.textsListPath);
      }
    }, builder: (context, state) {
      return state.status.isInProgress
          ? const CircularProgressIndicator()
          : AuthButton(
              state.type == AuthType.signIn ? 'Войти' : 'Зарегистрироваться',
              enabled: state.isValid,
              onPressed: () {
                context.read<AuthBloc>().add(state.type == AuthType.signIn
                    ? const SignInSubmitted()
                    : const SignUpSubmitted());
              },
            );
    });
  }
}

class _AuthLink extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) => previous.type != current.type,
        builder: (context, state) {
          return RichText(
              text: TextSpan(
                  text: state.type == AuthType.signIn
                      ? 'Нет аккаунта? Создайте сейчас!'
                      : 'Есть аккаунт? Войдите!',
                  style: const TextStyle(color: Colors.blue),
                  recognizer: TapGestureRecognizer()
                    ..onTap = () =>
                        context.read<AuthBloc>().add(const AuthTypeChanged())));
        });
  }
}
