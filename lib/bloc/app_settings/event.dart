part of 'bloc.dart';

@immutable
abstract class AppSettingsEvent {}

class LoadSettings extends AppSettingsEvent {}

class ChangeThemeEvent extends AppSettingsEvent {
  final ThemeMode themeMode;

  ChangeThemeEvent(this.themeMode);
}

class ChangeLocalEvent extends AppSettingsEvent {
  final Locale locale;

  ChangeLocalEvent(this.locale);
}
