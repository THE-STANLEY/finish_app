import 'package:finish/domain/repositories/settings/settings_repository_interface.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit({required SettingsRepositoryInterface settingsRepository})
      : _settingsRepository = settingsRepository,
        super(ThemeState(Brightness.light)) {
    _checkSelectedTheme();
  }

  final SettingsRepositoryInterface _settingsRepository;

  Future<void> setThemeBrightness(Brightness brightness) async {
    emit(ThemeState(brightness));
    await _settingsRepository
        .setDarkThemeSelected(brightness == Brightness.dark);
  }

  void _checkSelectedTheme() {
    final brightness = _settingsRepository.isDarkThemeSelected()
        ? Brightness.dark
        : Brightness.light;
    emit(ThemeState(brightness));
  }
}
