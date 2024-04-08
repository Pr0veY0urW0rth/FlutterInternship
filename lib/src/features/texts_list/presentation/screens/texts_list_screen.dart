import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/texts_list/data/datasource/remote/texts_list_supabase_datasource.dart';
import 'package:intership/src/features/texts_list/domain/usecases/fetch_texts_usecase.dart';
import 'package:intership/src/features/texts_list/presentation/bloc/texts_list_bloc.dart';
import 'package:intership/src/features/texts_list/presentation/widgets/texts_list.dart';

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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocProvider(
          create: (context) {
            return TextsListBloc(
              fetchTextsUseCase: sl.get<FetchTextsUseCase>(),
            );
          },
          child: const TextsList(),
        ),
      ),
    );
  }
}
