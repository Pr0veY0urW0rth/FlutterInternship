import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/features/settings/domain/usecases/delete_all_data_usecase.dart';
import 'package:intership/src/features/settings/domain/usecases/log_out_usecase.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final LogOutUseCase _logOutUseCase;
  final DeleteAllLocalDataUseCase _allLocalDataUseCase;
  final DeleteAllRemoteDataUseCase _allRemoteDataUseCase;

  SettingsBloc(
      {required LogOutUseCase logOutUseCase,
      required DeleteAllLocalDataUseCase deleteAllLocalDataUseCase,
      required DeleteAllRemoteDataUseCase deleteAllRemoteDataUseCase})
      : _logOutUseCase = logOutUseCase,
        _allLocalDataUseCase = deleteAllLocalDataUseCase,
        _allRemoteDataUseCase = deleteAllRemoteDataUseCase,
        super(const SettingsState()) {
    on<SettingsLogOut>(_onLoggedOut);
  }

  _onLoggedOut(SettingsLogOut event, Emitter<SettingsState> emit) {
    _logOutUseCase();
  }

  Future<void> _onDataDeletion(
      DataDeletion event, Emitter<SettingsState> emit) async {
    await _allLocalDataUseCase.call();
    await _allRemoteDataUseCase.call();
  }
}
