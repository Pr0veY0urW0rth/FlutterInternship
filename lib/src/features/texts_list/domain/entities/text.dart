import 'package:equatable/equatable.dart';
import 'package:intership/src/features/texts_list/data/models/text.dart';

class TextEntity extends Equatable {
  const TextEntity({
    required this.header,
    required this.text,
  });

  final String header;
  final String text;

  @override
  List<Object> get props => [header, text];
  factory TextEntity.fromModel(TextModel text) {
    return TextEntity(header: text.header, text: text.text);
  }
}
