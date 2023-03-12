import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData theme({bool isDark = false}) => ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
          brightness: isDark ? Brightness.dark : Brightness.light,
        ),
      );
}

class AppThemeFlex {
  static ThemeData theme({bool isDark = false}) => isDark
      ? FlexThemeData.dark(scheme: FlexScheme.sakura)
      : FlexThemeData.light(scheme: FlexScheme.sakura);
}
