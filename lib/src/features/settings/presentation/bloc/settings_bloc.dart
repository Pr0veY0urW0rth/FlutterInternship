import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/features/settings/domain/usecases/log_out_usecase.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final LogOutUseCase _logOutUseCase;

  SettingsBloc({required logOutUseCase})
      : _logOutUseCase = logOutUseCase,
        super(const SettingsState()) {
    on<SettingsLogOut>(_onLoggedOut);
  }

  _onLoggedOut(SettingsLogOut event, Emitter<SettingsState> emit) {
    _logOutUseCase();
  }
}
