import 'package:cal/common/colors/colors.dart';
import 'package:cal/common/extensions/custom_theme_extension.dart';
import 'package:flutter/material.dart';

ThemeData darkTheme() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    appBarTheme: const AppBarTheme(color: maincolor),
    backgroundColor: darkbackground,
    scaffoldBackgroundColor: darkbackground,
    extensions: [
      CustomThemeExtension.darkMode,
    ],
    switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Colors.grey),
        trackColor: MaterialStatePropertyAll(Color(0xFF344047))),
  );
}
