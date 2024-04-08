import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/features/texts_list/presentation/bloc/texts_list_bloc.dart';
import 'package:intership/src/features/texts_list/presentation/widgets/text_tile.dart';

class TextsList extends StatelessWidget {
  const TextsList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextsListBloc, TextsListState>(
        buildWhen: (previous, current) => previous.status != current.status,
        builder: (context, state) {
          switch (state.status) {
            case TextStatus.initial:
              return ElevatedButton(
                  onPressed: () =>
                      context.read<TextsListBloc>().add(const TextsFetched()),
                  child: Text('Загрузить данные'));
            case TextStatus.loading:
              return CircularProgressIndicator();
            case TextStatus.success:
              return ListView.builder(
                itemBuilder: ((context, index) => index < state.list.length
                    ? TextTile(
                        header: state.list[index].header,
                        text: state.list[index].text,
                        onPressed: () => (Platform.isIOS || Platform.isAndroid)
                            ? context.goNamed(AppRouter.textDetailsPath,
                                pathParameters: {
                                    'header': state.list[index].header,
                                    'text': state.list[index].text
                                  })
                            : context.goNamed(AppRouter.textEditPath,
                                pathParameters: {
                                    'id':
                                        state.list[index].supabaseId.toString(),
                                  }),
                      )
                    : ElevatedButton(
                        onPressed: () => context
                            .read<TextsListBloc>()
                            .add(const TextsFetched()),
                        child: Text('Загрузить данные'))),
                itemCount: state.list.length + 1,
              );
            case TextStatus.failure:
              return const Text('Ашипка');
          }
        });
  }
}
