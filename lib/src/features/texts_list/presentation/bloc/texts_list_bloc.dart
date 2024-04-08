import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/features/texts_list/domain/entities/text.dart';

part 'texts_list_event.dart';
part 'texts_list_state.dart';

class TextsListBloc extends Bloc<TextsListEvent, TextsListState> {
  TextsListBloc(super.initialState);
}
