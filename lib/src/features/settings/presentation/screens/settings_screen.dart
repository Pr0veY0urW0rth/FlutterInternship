import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/settings/domain/usecases/log_out_usecase.dart';
import 'package:intership/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:intership/src/features/settings/presentation/widgets/settings_menu.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocProvider(
          create: (context) {
            return SettingsBloc(
              logOutUseCase: sl.get<LogOutUseCase>(),
            );
          },
          child: const SettingsMenu(),
        ),
      ),
    );
  }
}
