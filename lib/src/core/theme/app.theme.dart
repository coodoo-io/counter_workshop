import 'package:flutter/material.dart';

class AppTheme {
  // Light Mode
  final Color primaryColor = Colors.black;
  final Color scaffoldColor = const Color(0xfff5f5f5);
  final Color headlineColor = const Color(0xff333333);

  // Dark Mode
  final Color primaryColorDark = Colors.white;
  final Color scaffoldColorDark = const Color(0xff2a2a2a);
  final Color headlineColorDark = const Color(0xffcdcdcd);

  ThemeData get light {
    return _buildTheme(isLightMode: true);
  }

  ThemeData get dark {
    return _buildTheme(isLightMode: false);
  }

  ThemeData _buildTheme({bool isLightMode = true}) {
    final ThemeData base = isLightMode ? ThemeData.light() : ThemeData.dark();
    final currentPrimaryColor = isLightMode ? primaryColor : primaryColorDark;
    final currentHeadlineColor = isLightMode ? headlineColor : headlineColorDark;

    return base.copyWith(
      brightness: isLightMode ? Brightness.light : Brightness.dark,
      useMaterial3: true,
      primaryColor: currentPrimaryColor,
      scaffoldBackgroundColor: isLightMode ? scaffoldColor : scaffoldColorDark,
      appBarTheme: base.appBarTheme.copyWith(
        backgroundColor: Colors.transparent,
        foregroundColor: currentPrimaryColor,
        titleTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: currentPrimaryColor,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          side: BorderSide(width: 2.0, color: currentHeadlineColor),
          foregroundColor: currentHeadlineColor,
        ),
      ),
      textTheme: base.textTheme.copyWith(
        headlineLarge: TextStyle(
          fontFamily: 'VarelaRound',
          color: currentHeadlineColor,
          fontSize: 160,
        ),
      ),
    );
  }
}
