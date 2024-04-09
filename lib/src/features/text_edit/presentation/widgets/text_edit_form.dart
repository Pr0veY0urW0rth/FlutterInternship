import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:formz/formz.dart';
import 'package:go_router/go_router.dart';
import 'package:intership/src/core/router/app_router.dart';
import 'package:intership/src/features/text_edit/presentation/bloc/text_edit_bloc.dart';
import 'package:intership/src/features/text_edit/presentation/widgets/text_edit_button.dart';
import 'package:intership/src/features/text_edit/presentation/widgets/text_editing_field.dart';

class TextEditForm extends StatelessWidget {
  const TextEditForm({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TextEditBloc, TextEditState>(
      buildWhen: (previous, current) => previous.header != current.header,
      builder: (context, state) {
        return const SingleChildScrollView(
          child: Column(
            children: [
              _HeaderEditingField(),
              _TextEditingField(),
              _TextEditButton()
            ],
          ),
        );
      },
    );
  }
}

class _HeaderEditingField extends StatelessWidget {
  const _HeaderEditingField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<TextEditBloc, TextEditState>(
        buildWhen: (previous, current) => previous.header != current.header,
        builder: (context, state) => Container(
              child: TextEditingField(
                controller: controller,
                text: state.header,
                inputType: TextInputType.multiline,
                onChanged: (header) =>
                    context.read<TextEditBloc>().add(TextHeaderChanged(header)),
              ),
            ));
  }
}

class _TextEditingField extends StatelessWidget {
  const _TextEditingField({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TextEditingController();
    return BlocBuilder<TextEditBloc, TextEditState>(
        buildWhen: (previous, current) => previous.text != current.text,
        builder: (context, state) => Container(
              child: TextEditingField(
                controller: controller,
                text: state.text,
                inputType: TextInputType.multiline,
                onChanged: (text) =>
                    context.read<TextEditBloc>().add(TextChanged(text)),
              ),
            ));
  }
}

class _TextEditButton extends StatelessWidget {
  const _TextEditButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<TextEditBloc, TextEditState>(
        listener: (context, state) {
      if (state.status == FormzSubmissionStatus.success) {
        context.go(AppRouter.textsListPath);
      }
    }, builder: (context, state) {
      return state.status.isInProgress
          ? const CircularProgressIndicator()
          : TextEditButton(
              'Сохранить',
              onPressed: () {
                context.read<TextEditBloc>().add(const TextSaved());
              },
            );
    });
  }
}
