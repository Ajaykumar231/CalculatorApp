import 'package:cal/common/colors/colors.dart';
import 'package:cal/common/extensions/custom_theme_extension.dart';
import 'package:flutter/material.dart';

ThemeData lightTheme() {
   ThemeData base = ThemeData.light();
  return base.copyWith(
    appBarTheme: const AppBarTheme(color: lightbackground),
    backgroundColor: textcolor,
    scaffoldBackgroundColor: lightbackground,
    extensions: [
      CustomThemeExtension.lightMode,
    ],
    switchTheme: const SwitchThemeData(
        thumbColor: MaterialStatePropertyAll(Color(0xFF83939C)),
        trackColor: MaterialStatePropertyAll(Color(0xFFDADFE2))),
  );
}
