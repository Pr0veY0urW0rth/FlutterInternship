part of 'text_edit_bloc.dart';

class TextEditState extends Equatable {
  const TextEditState({
    required this.id,
    this.header = '',
    this.text = '',
    this.status = FormzSubmissionStatus.initial,
  });

  final String header;
  final int id;
  final FormzSubmissionStatus status;
  final String text;

  @override
  List<Object> get props => [id, header, text, status];

  TextEditState copyWith({
    int? id,
    String? header,
    String? text,
    FormzSubmissionStatus? status,
  }) {
    return TextEditState(
      id: id ?? this.id,
      header: header ?? this.header,
      text: text ?? this.text,
      status: status ?? this.status,
    );
  }
}
