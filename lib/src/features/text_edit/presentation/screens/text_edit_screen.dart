import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/core/user_cache_service/domain/usecase/user_supabase_check_usecase.dart';
import 'package:intership/src/core/utils/injections.dart';
import 'package:intership/src/features/text_edit/domain/usecases/get_text_by_id_usecase.dart';
import 'package:intership/src/features/text_edit/domain/usecases/save_text_localy_usecase.dart';
import 'package:intership/src/features/text_edit/domain/usecases/save_text_remotely_usecase.dart';
import 'package:intership/src/features/text_edit/presentation/bloc/text_edit_bloc.dart';
import 'package:intership/src/features/text_edit/presentation/widgets/text_edit_form.dart';

class TextEditScreen extends StatelessWidget {
  const TextEditScreen({super.key, required this.id});

  final int id;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: IconButton(
          onPressed: () => context.go(AppRouter.textsListPath),
          icon: const Icon(Icons.arrow_back_ios_new_outlined),
          color: Colors.white,
        ),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: BlocProvider(
          create: (context) {
            return TextEditBloc(
                getTextByIdUseCase: sl.get<GetTextByIdUseCase>(),
                saveTextLocalyUseCase: sl.get<SaveTextLocalyUseCase>(),
                saveTextRemotelyUseCase: sl.get<SaveTextRemotelyUseCase>(),
                userSupabaseCheckUseCase: sl.get<UserSupabaseCheckUseCase>(),
                id: id)
              ..add(const SavedTextGotten());
          },
          child: const TextEditForm(),
        ),
      ),
    );
  }
}
