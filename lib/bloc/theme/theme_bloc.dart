import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:quotes_app/helpers/app_theme.dart';

part 'theme_event.dart';
part 'theme_state.dart';

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  ThemeBloc()
      : super(ThemeState(
            themeData: appThemeData[AppTheme.lightTheme]!, isDark: false)) {
    on<ChangeThemeEvent>((event, emit) {
      if (event is ChangeThemeEvent) {
        emit.call(ThemeState(
            themeData: appThemeData[event.theme]!, isDark: event.isDark));
      }
    });
  }
}
