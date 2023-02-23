
import 'package:flutter/material.dart';


ThemeData light = ThemeData(
  fontFamily: 'Ubuntu',
  primaryColor: Color(0xFF0461A5),  //primary-color
  primaryColorLight: Color(0xFF0461A5), //light-primary-color
  primaryColorDark: Color(0xFF10324A), //light-primary-dark-mode
  backgroundColor: Color(0xFFF7F9FC),//light-background
  secondaryHeaderColor: Color(0xFF8797AB),
  cardColor: Color(0xFFFFFFFF),//semi-dark-light-color

  disabledColor: Color(0xFF9E9E9E),
  scaffoldBackgroundColor: Color(0xFFFFFFFF),
  errorColor: Color(0xFFFF6767),
  brightness: Brightness.light,
  hintColor: Color(0xFF838383),
  focusColor: Color(0xFFFFFFFF),
  hoverColor: Color(0xFF033969),
  shadowColor: Color(0xFFD1D5DB),

  colorScheme: ColorScheme.light(
      primary: Color(0xFF0461A5),
      secondary: Color(0xFFFF9900),
      tertiary: Color(0xFFFF6767),
      surfaceTint: Color(0xff158a52)
  ),
);