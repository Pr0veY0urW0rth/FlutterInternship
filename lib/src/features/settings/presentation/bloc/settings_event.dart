part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
  @override
  List<Object?> get props => [];
}

class SettingsLogOut extends SettingsEvent {
  const SettingsLogOut();
}

class DataDeletion extends SettingsEvent {
  const DataDeletion();
}
