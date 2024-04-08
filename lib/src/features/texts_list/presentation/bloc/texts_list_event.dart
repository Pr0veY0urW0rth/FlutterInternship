part of 'texts_list_bloc.dart';

abstract class TextsListEvent extends Equatable {
  const TextsListEvent();
  @override
  List<Object?> get props => [];
}

class SavedTextsFetched extends TextsListEvent {
  const SavedTextsFetched();
}

class TextsFetched extends TextsListEvent {
  const TextsFetched();
}
