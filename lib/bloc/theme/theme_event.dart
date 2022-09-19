part of 'theme_bloc.dart';

abstract class ThemeEvent extends Equatable {
  const ThemeEvent();
}

class ChangeThemeEvent extends ThemeEvent {
  final AppTheme theme;
  final bool isDark;
  const ChangeThemeEvent({required this.theme, required this.isDark});
  @override
  List<Object> get props => [theme, isDark];
}
