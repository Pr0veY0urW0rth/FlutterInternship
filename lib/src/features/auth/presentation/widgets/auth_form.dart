import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
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
              const SnackBar(content: Text('Authentication Failure')),
            );
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [_EmailInput(), _PasswordInput(), _AuthButton()],
        ),
      ),
    );
  }
}

class _EmailInput extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
        buildWhen: (previous, current) => previous.email != current.email,
        builder: (context, state) {
          return AuthField(
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
        buildWhen: (previous, current) => previous.password != current.password,
        builder: (context, state) {
          return AuthField(
            label: 'Пароль',
            onChanged: (password) =>
                context.read<AuthBloc>().add(AuthPasswordChanged(password)),
            hintText: 'Введите пароль',
            suffixIcon: const Icon(Icons.lock_outline_rounded),
            obscureText: true,
            errorText:
                state.email.displayError != null ? 'Неверный пароль!' : null,
          );
        });
  }
}

class _AuthButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(builder: (context, state) {
      return state.status.isInProgress
          ? const CircularProgressIndicator()
          : AuthButton(
              'Войти',
              enabled: state.isValid,
              onPressed: () =>
                  context.read<AuthBloc>().add(const AuthSubmitted()),
            );
    });
  }
}
