import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:manager_app/themes/theme.dart';
import 'package:meta/meta.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themeMode: ThemeMode.light)){
    updateTheme();
  }

  updateTheme(){
    final Brightness currentSystemBrightness = AppTheme.currentSystemBrightness;
    currentSystemBrightness == Brightness.dark ? _setTheme(ThemeMode.dark) : _setTheme(ThemeMode.light);
  }

  void _setTheme(ThemeMode themeMode){
    AppTheme.setStatusBarAndNavigationBarColors(themeMode);
    emit(ThemeState(themeMode: themeMode));
  }

}
