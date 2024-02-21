import 'package:currency_converter/data/repositories/app_settings_repositoy.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'event.dart';
part 'state.dart';

class AppSettingsBloc extends Bloc<AppSettingsEvent, AppSettingsState> {
  final AppSettingsRepository settingsRepository;

  AppSettingsBloc(this.settingsRepository) : super(SettingsInitial()) {
    on<LoadSettings>(_onLoadSettings);
    on<ChangeThemeEvent>(_onChangeThemeEvent);
    on<ChangeLocalEvent>(_onChangeLocalEvent);
  }

  _onLoadSettings(LoadSettings event, Emitter<AppSettingsState> emit) async {
    try {
      // ThemeMode themeMode = await settingsRepository.getThemeData();
      Locale locale = await settingsRepository.getLocal();
      emit(SettingsLoadedState(locale));
    } catch (e) {
      _emitError(e);
    }
  }

  _onChangeThemeEvent(ChangeThemeEvent event, Emitter<AppSettingsState> emit) async {
    try {
      ThemeMode themeMode = await settingsRepository.changeThemeData(event.themeMode);
      emit(ThemeModeLoadedState(themeMode));
    } catch (e) {
      _emitError(e);
    }
  }

  _onChangeLocalEvent(ChangeLocalEvent event, Emitter<AppSettingsState> emit) async {
    try {
      Locale locale = await settingsRepository.changeLocalData(event.locale);
      emit(LocalLoadedState(locale));
    } catch (e) {
      _emitError(e);
    }
  }

  _emitError(error) async {
    debugPrint('Error happened in SettingsBloc of type ${error.runtimeType} with output ${error.message.toString()} ');
    try {
      // ThemeMode themeMode = await settingsRepository.getThemeData();
      Locale locale = await settingsRepository.getLocal();
      // ignore: invalid_use_of_visible_for_testing_member
      emit(SettingsLoadedState(locale));
    } catch (error) {
      // ignore: invalid_use_of_visible_for_testing_member
      emit(SettingsLoadedState(const Locale('en')));
    }
  }
}
