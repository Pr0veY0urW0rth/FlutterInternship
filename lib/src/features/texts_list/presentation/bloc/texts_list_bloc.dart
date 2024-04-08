import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/features/texts_list/domain/entities/text.dart';
import 'package:intership/src/features/texts_list/domain/usecases/fetch_texts_usecase.dart';

part 'texts_list_event.dart';
part 'texts_list_state.dart';

class TextsListBloc extends Bloc<TextsListEvent, TextsListState> {
  TextsListBloc({
    required FetchTextsUseCase fetchTextsUseCase,
  })  : _fetchTextsUseCase = fetchTextsUseCase,
        super(const TextsListState()) {
    on<TextsFetched>(_onTextsFetched);
  }

  final FetchTextsUseCase _fetchTextsUseCase;

  void _onTextsFetched(
      TextsListEvent event, Emitter<TextsListState> emit) async {
    emit(state.copyWith(status: TextStatus.loading));
    final data = await _fetchTextsUseCase.call();
    emit(state.copyWith(list: data, status: TextStatus.success));
  }
}
