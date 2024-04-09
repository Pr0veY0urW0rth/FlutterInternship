import 'package:equatable/equatable.dart';

import 'package:intership/src/shared/data/models/text.dart';

class TextEntity extends Equatable {
  const TextEntity({
    required this.header,
    required this.text,
    required this.supabaseId,
  });

  final String header;
  final String text;
  final int supabaseId;

  @override
  List<Object> get props => [header, text, supabaseId];
  factory TextEntity.fromModel(TextModel text) {
    return TextEntity(
        header: text.header, text: text.text, supabaseId: text.supabaseId);
  }
}
