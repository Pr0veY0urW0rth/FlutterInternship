import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/shared/domain/entities/text.dart';
import 'package:intership/src/features/texts_list/domain/usecases/fetch_texts_usecase.dart';
import 'package:intership/src/features/texts_list/domain/usecases/get_saved_texts_usecase.dart';
import 'package:intership/src/features/texts_list/domain/usecases/save_texts_usecase.dart';

part 'texts_list_event.dart';
part 'texts_list_state.dart';

class TextsListBloc extends Bloc<TextsListEvent, TextsListState> {
  TextsListBloc({
    required FetchTextsUseCase fetchTextsUseCase,
    required SaveTextsUseCase saveTextsUseCase,
    required GetSavedTextsUseCase getSavedTextsUseCase,
  })  : _fetchTextsUseCase = fetchTextsUseCase,
        _saveTextsUseCase = saveTextsUseCase,
        _getSavedTextsUseCase = getSavedTextsUseCase,
        super(const TextsListState()) {
    on<TextsFetched>(_onTextsFetched);
    on<SavedTextsFetched>(_onSavedTextsFetched);
  }

  final FetchTextsUseCase _fetchTextsUseCase;
  final SaveTextsUseCase _saveTextsUseCase;
  final GetSavedTextsUseCase _getSavedTextsUseCase;

  void _onTextsFetched(TextsFetched event, Emitter<TextsListState> emit) async {
    emit(state.copyWith(status: TextStatus.loading));
    final data = await _fetchTextsUseCase.call();
    emit(state.copyWith(list: data, status: TextStatus.success));
    _saveTextsUseCase(params: state.list);
  }

  void _onSavedTextsFetched(
      SavedTextsFetched event, Emitter<TextsListState> emit) async {
    emit(state.copyWith(status: TextStatus.loading));
    final data = await _getSavedTextsUseCase.call();
    emit(state.copyWith(list: data, status: TextStatus.success));
    _saveTextsUseCase(params: state.list);
  }
}
