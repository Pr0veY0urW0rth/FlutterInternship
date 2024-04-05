import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/auth/domain/usecases/sign_in_usecase.dart';
import 'package:intership/src/features/auth/domain/usecases/sign_up_usecase.dart';
import 'package:intership/src/features/auth/presentation/bloc/auth_form_bloc.dart';
import 'package:intership/src/features/auth/presentation/widgets/auth_form.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocProvider(
          create: (context) {
            return AuthBloc(
                signInUseCase: sl.get<SignInUseCase>(),
                signUpUseCase: sl.get<SignUpUseCase>());
          },
          child: const AuthForm(),
        ),
      ),
    );
  }
}
