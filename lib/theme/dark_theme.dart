import 'package:flutter/material.dart';

ThemeData dark = ThemeData(
  fontFamily: 'Ubuntu',
  primaryColor: Color(0xFF02487B),  //primary-color
  primaryColorLight: Color(0xFFF0F4F8), //light-primary-color
  primaryColorDark: Color(0xFF10324A), //light-primary-dark-mode
  backgroundColor: Color(0xFF010d15),//dark-background
  secondaryHeaderColor: Color(0xFF8797AB), //semi-dark-light-color
  cardColor: Color(0xFF10324a),

  disabledColor: Color(0xFF484848),
  scaffoldBackgroundColor: Color(0xFF010d15),
  errorColor: Color(0xFFdd3135),
  brightness: Brightness.dark,
  hintColor: Color(0xFFFFFFFF),
  focusColor: Color(0xFF484848),
  hoverColor: Color(0xFFABA9A7),
  shadowColor: Color(0xFF4a5361),

  colorScheme: ColorScheme.dark(
      primary: Color(0xFF02385F),
      secondary: Color(0xFFf57d00),
      tertiary: Color(0xFFFF6767),
      surfaceTint: Color(0xff158a52)
  ),
  //textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(backgroundColor: Color(0xFFFFFFFF))),
);

// semi-dark-light-color