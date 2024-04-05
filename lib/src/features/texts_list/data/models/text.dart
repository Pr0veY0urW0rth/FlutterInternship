// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:hive_flutter/adapters.dart';
import 'package:intership/src/features/texts_list/domain/entities/text.dart';

part 'text.g.dart';

@HiveType(typeId: 0, adapterName: 'TextModelAdapter')
class TextModel extends HiveObject {
  TextModel({
    required this.header,
    required this.text,
  });

  @HiveField(0)
  final String header;

  @HiveField(1)
  final String text;

  factory TextModel.fromEntity(TextEntity text) {
    return TextModel(header: text.header, text: text.text);
  }
}
