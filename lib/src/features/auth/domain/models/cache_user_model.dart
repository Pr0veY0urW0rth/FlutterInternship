// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CacheUserModel {
  final String email;
  final String token;
  CacheUserModel(
    this.email,
    this.token,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'email': email,
      'token': token,
    };
  }

  factory CacheUserModel.fromMap(Map<String, dynamic> map) => CacheUserModel(
        map['email'] as String,
        map['token'] as String,
      );

  String toJson() => json.encode(toMap());

  factory CacheUserModel.fromJson(String source) =>
      CacheUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
