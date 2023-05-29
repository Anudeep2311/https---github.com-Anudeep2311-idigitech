import 'dart:ui';
import 'package:flutter/material.dart';

const MaterialColor primary = MaterialColor(_primaryPrimaryValue, <int, Color>{
  50: Color(0xFFEDF5EA),
  100: Color(0xFFD2E5CA),
  200: Color(0xFFB5D4A7),
  300: Color(0xFF97C284),
  400: Color(0xFF80B569),
  500: Color(_primaryPrimaryValue),
  600: Color(0xFF62A048),
  700: Color(0xFF57973F),
  800: Color(0xFF4D8D36),
  900: Color(0xFF3C7D26),
});
 const int _primaryPrimaryValue = 0xFF6AA84F;

 const MaterialColor primaryAccent = MaterialColor(_primaryAccentValue, <int, Color>{
  100: Color(0xFFCDFFBE),
  200: Color(_primaryAccentValue),
  400: Color(0xFF7FFF58),
  700: Color(0xFF6CFF3F),
});
 const int _primaryAccentValue = 0xFFA6FF8B;