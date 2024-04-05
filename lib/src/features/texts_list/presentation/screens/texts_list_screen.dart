import 'package:flutter/material.dart';
import 'package:intership/src/features/texts_list/data/datasource/local/texts_list_hive_datasource.dart';

class TextsListScreen extends StatelessWidget {
  TextsListScreen({super.key});
  final cringe = TextsListHiveDatasource();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Список текстов',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.blue,
      ),
      body: const Center(
        child: Column(
          children: [Text('Texts List')],
        ),
      ),
    );
  }
}
