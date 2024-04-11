// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:equatable/equatable.dart';

class QRTextEntity extends Equatable {
  const QRTextEntity(this.header, this.text);

  final String header;
  final String text;

  @override
  List<Object> get props => [header, text];

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'header': header,
      'text': text,
    };
  }

  factory QRTextEntity.fromMap(Map<String, dynamic> map) {
    return QRTextEntity(
      map['header'] as String,
      map['text'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory QRTextEntity.fromJson(String source) =>
      QRTextEntity.fromMap(json.decode(source) as Map<String, dynamic>);

  QRTextEntity copyWith({
    String? header,
    String? text,
  }) {
    return QRTextEntity(
      header ?? this.header,
      text ?? this.text,
    );
  }
}
