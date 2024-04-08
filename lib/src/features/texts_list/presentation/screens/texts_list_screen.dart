import 'package:flutter/material.dart';
import 'package:intership/src/features/texts_list/data/datasource/remote/texts_list_supabase_datasource.dart';

class TextsListScreen extends StatelessWidget {
  TextsListScreen({super.key});
  final cringe = TextsListSupabaseDatasource();

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
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: () async {
                  var res = await cringe.fetchTexts();
                  print(res);
                },
                child: Text('data'))
          ],
        ),
      ),
    );
  }
}
