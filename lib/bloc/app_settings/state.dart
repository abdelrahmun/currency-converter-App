part of 'bloc.dart';

@immutable
abstract class AppSettingsState {}

class SettingsInitial extends AppSettingsState {}

class SettingsLoadedState extends AppSettingsState {
  final Locale locale;

  SettingsLoadedState(this.locale);
}

class LocalLoadedState extends AppSettingsState {
  final Locale locale;

  LocalLoadedState(this.locale);
}

class ThemeModeLoadedState extends AppSettingsState {
  final ThemeMode themeMode;

  ThemeModeLoadedState(this.themeMode);
}
