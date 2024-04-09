import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:intership/src/features/settings/presentation/widgets/settings_button.dart';

class SettingsMenu extends StatelessWidget {
  const SettingsMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (BuildContext context, state) {
        return SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SettingsButton('Выйти из учетной записи', onPressed: () {
                  context.read<SettingsBloc>().add(const SettingsLogOut());
                  context.go(AppRouter.authPath);
                })
              ],
            ),
          ),
        );
      },
    );
  }
}
