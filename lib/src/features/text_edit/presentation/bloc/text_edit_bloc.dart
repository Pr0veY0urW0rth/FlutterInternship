import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:intership/src/core/utils/constants/text_edit_enums.dart';
import 'package:intership/src/features/text_edit/domain/usecases/get_text_by_id_usecase.dart';
import 'package:intership/src/features/text_edit/domain/usecases/save_text_localy_usecase.dart';
import 'package:intership/src/features/text_edit/domain/usecases/save_text_remotely_usecase.dart';
import 'package:intership/src/shared/domain/entities/text.dart';

part 'text_edit_event.dart';
part 'text_edit_state.dart';

class TextEditBloc extends Bloc<TextEditEvent, TextEditState> {
  TextEditBloc(
      {required GetTextByIdUseCase getTextByIdUseCase,
      required SaveTextLocalyUseCase saveTextLocalyUseCase,
      required SaveTextRemotelyUseCase saveTextRemotelyUseCase,
      required int id})
      : _getTextByIdUseCase = getTextByIdUseCase,
        _saveTextLocalyUseCase = saveTextLocalyUseCase,
        _saveTextRemotelyUseCase = saveTextRemotelyUseCase,
        super(TextEditState(id: id)) {
    on<TextChanged>(_onTextChanged);
    on<TextHeaderChanged>(_onTextHeaderChanged);
    on<SavedTextGotten>(_onSavedTextGotten);
    on<TextSaved>(_onTextSaved);
  }

  final GetTextByIdUseCase _getTextByIdUseCase;
  final SaveTextLocalyUseCase _saveTextLocalyUseCase;
  final SaveTextRemotelyUseCase _saveTextRemotelyUseCase;

  Future<void> _onTextSaved(
      TextSaved event, Emitter<TextEditState> emit) async {
    emit(state.copyWith(status: FormzSubmissionStatus.inProgress));
    final entity = TextEntity(
        header: state.header, text: state.text, supabaseId: state.id);
    await _saveTextLocalyUseCase(params: entity);
    await _saveTextRemotelyUseCase(params: entity);
    emit(state.copyWith(status: FormzSubmissionStatus.success));
  }

  Future<void> _onSavedTextGotten(
      SavedTextGotten event, Emitter<TextEditState> emit) async {
    final data = await _getTextByIdUseCase(params: state.id);
    emit(state.copyWith(header: data.header, text: data.text));
  }

  void _onTextHeaderChanged(
      TextHeaderChanged event, Emitter<TextEditState> emit) {
    emit(state.copyWith(
        header: event.header, status: FormzSubmissionStatus.initial));
  }

  void _onTextChanged(TextChanged event, Emitter<TextEditState> emit) {
    emit(state.copyWith(
        text: event.text, status: FormzSubmissionStatus.initial));
  }

  void _onQRGenerated(QRCodeGenerated evenet, Emitter<TextEditState> emit) {}
}
