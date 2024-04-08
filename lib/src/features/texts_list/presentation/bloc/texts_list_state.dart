// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'texts_list_bloc.dart';

enum TextStatus { initial, success, failure }

class TextsListState extends Equatable {
  const TextsListState({
    this.list = const <TextEntity>[],
    this.status = TextStatus.initial,
  });

  final List<TextEntity> list;
  final TextStatus status;

  @override
  List<Object?> get props => [list, status];

  TextsListState copyWith({
    List<TextEntity>? list,
    TextStatus? status,
  }) {
    return TextsListState(
      list: list ?? this.list,
      status: status ?? this.status,
    );
  }

  @override
  String toString() {
    return 'TextsListState : { status : $status, texts : ${list.length}}';
  }
}
