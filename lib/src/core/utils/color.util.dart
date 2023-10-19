import 'package:flutter/material.dart';

class ColorUtil {
  static bool isLightMode(ThemeData theme) {
    return theme.brightness == Brightness.light;
  }

  static bool isDarkMode(ThemeData theme) {
    return theme.brightness == Brightness.dark;
  }

  static Color blackOrWhiteText(Color backgroundColor) {
    return backgroundColor.computeLuminance() > 0.5 ? Colors.black : Colors.white;
  }

  static dynamic generateMaterialColor(int primaryColorInt, Color primaryColor) {
    return MaterialColor(primaryColorInt, {
      50: primaryColor.withOpacity(.1),
      100: primaryColor.withOpacity(.2),
      200: primaryColor.withOpacity(.3),
      300: primaryColor.withOpacity(.4),
      400: primaryColor.withOpacity(.5),
      500: primaryColor.withOpacity(.6),
      600: primaryColor.withOpacity(.7),
      700: primaryColor.withOpacity(.8),
      800: primaryColor.withOpacity(.9),
      900: primaryColor.withOpacity(1),
    });
  }
}
