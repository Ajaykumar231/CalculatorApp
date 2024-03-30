import 'package:cal/common/colors/colors.dart';
import 'package:flutter/material.dart';

extension ExtendedTheme on BuildContext {
  CustomThemeExtension get theme {
    return Theme.of(this).extension<CustomThemeExtension>()!;
  }
}

class CustomThemeExtension extends ThemeExtension<CustomThemeExtension> {
  final Color? buttoncolor;

  const CustomThemeExtension({
    this.buttoncolor,
  });

  static const lightMode = CustomThemeExtension(buttoncolor: btncolor);

  static const darkMode = CustomThemeExtension(buttoncolor: btncolor);

  @override
  ThemeExtension<CustomThemeExtension> copyWith({
    Color? buttoncolor,
  }) {
    return CustomThemeExtension(
      buttoncolor: buttoncolor ?? this.buttoncolor,
    );
  }

  @override
  ThemeExtension<CustomThemeExtension> lerp(
      ThemeExtension<CustomThemeExtension>? other, double t) {
    if (other is! CustomThemeExtension) return this;
    return CustomThemeExtension(
      buttoncolor: Color.lerp(buttoncolor, other.buttoncolor, t),
    );
  }
}
