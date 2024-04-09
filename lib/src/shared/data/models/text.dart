// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_flutter/adapters.dart';

import 'package:intership/src/shared/domain/entities/text.dart';

part 'text.g.dart';

@HiveType(typeId: 0, adapterName: 'TextModelAdapter')
class TextModel extends HiveObject {
  TextModel({
    required this.header,
    required this.text,
    required this.supabaseId,
  });

  @HiveField(0)
  final String header;

  @HiveField(1)
  final String text;

  @HiveField(2)
  final int supabaseId;

  factory TextModel.fromEntity(TextEntity text) {
    return TextModel(
        header: text.header, text: text.text, supabaseId: text.supabaseId);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header,
      'text': text,
      'id': supabaseId,
    };
  }

  factory TextModel.fromMap(Map<String, dynamic> map) {
    return TextModel(
      header: map['header'] as String,
      text: map['text'] as String,
      supabaseId: map['id'] as int,
    );
  }

  String toJson() => json.encode(toMap());

  factory TextModel.fromJson(String source) =>
      TextModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
