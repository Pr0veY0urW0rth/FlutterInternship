part of 'text_edit_bloc.dart';

abstract class TextEditEvent extends Equatable {
  const TextEditEvent();

  @override
  List<Object?> get props => [];
}

class TextSaved extends TextEditEvent {
  const TextSaved();
}

class SavedTextGotten extends TextEditEvent {
  const SavedTextGotten();
}

class TextHeaderChanged extends TextEditEvent {
  const TextHeaderChanged(this.header);

  final String header;

  @override
  List<Object> get props => [header];
}

class TextChanged extends TextEditEvent {
  const TextChanged(this.text);

  final String text;

  @override
  List<Object> get props => [text];
}

class QRCodeGenerated extends TextEditEvent {
  const QRCodeGenerated();
}
