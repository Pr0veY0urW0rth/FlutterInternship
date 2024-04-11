// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header,
      'text': text,
      'supabaseId': supabaseId,
    };
  }

  factory TextEntity.fromMap(Map<String, dynamic> map) {
    return TextEntity(
      header: map['header'] as String,
      text: map['text'] as String,
      supabaseId: map['supabaseId'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextEntity.fromJson(String source) =>
      TextEntity.fromMap(json.decode(source) as Map<String, dynamic>);
}
