import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/change_supabase_optionality_usecase.dart';
import 'package:intership/src/features/settings/domain/usecases/delete_all_data_usecase.dart';
import 'package:intership/src/features/settings/domain/usecases/log_out_usecase.dart';
part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final LogOutUseCase _logOutUseCase;
  final DeleteAllLocalDataUseCase _allLocalDataUseCase;
  final DeleteAllRemoteDataUseCase _allRemoteDataUseCase;
  final ChangeSupabaseOptionalityUseCase _changeSupabaseOptionalityUseCase;

  SettingsBloc(
      {required LogOutUseCase logOutUseCase,
      required DeleteAllLocalDataUseCase deleteAllLocalDataUseCase,
      required DeleteAllRemoteDataUseCase deleteAllRemoteDataUseCase,
      required ChangeSupabaseOptionalityUseCase
          changeSupabaseOptionalityUseCase})
      : _logOutUseCase = logOutUseCase,
        _allLocalDataUseCase = deleteAllLocalDataUseCase,
        _allRemoteDataUseCase = deleteAllRemoteDataUseCase,
        _changeSupabaseOptionalityUseCase = changeSupabaseOptionalityUseCase,
        super(const SettingsState()) {
    on<SettingsLogOut>(_onLoggedOut);
    on<DataDeletion>(_onDataDeletion);
    on<SupabaseUsageChanged>(_onSupabaseUsageChanged);
  }

  _onLoggedOut(SettingsLogOut event, Emitter<SettingsState> emit) {
    _logOutUseCase();
  }

  Future<void> _onDataDeletion(
      DataDeletion event, Emitter<SettingsState> emit) async {
    await _allLocalDataUseCase.call();
    await _allRemoteDataUseCase.call();
  }

  Future<void> _onSupabaseUsageChanged(
      SupabaseUsageChanged event, Emitter<SettingsState> emit) async {
    await _changeSupabaseOptionalityUseCase.call();
  }
}
