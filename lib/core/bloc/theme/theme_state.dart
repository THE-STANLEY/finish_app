part of 'theme_cubit.dart';

@immutable
class ThemeState {
  final Brightness brightness;

  bool get isDark => brightness == Brightness.dark;

  const ThemeState(this.brightness);
}
