import 'dart:ui';

import 'package:flutter/material.dart';

final appTheme = ThemeData(
  scaffoldBackgroundColor: const Color(0XFFF5F5FA),
  primaryColor: const Color(0XFF7A5FC9), // purple
  accentColor: const Color(0XFF283335), // black
  textTheme: const TextTheme(
    headlineLarge: TextStyle(
      color: Color(0XFF283335),
      fontSize: 23,
      fontWeight: FontWeight.w500,
    ),
    headlineMedium: TextStyle(
      color: Color(0XFF283335),
      fontSize: 16,
    ),
    bodyLarge: TextStyle(
      color: Color(0XFFFFFFFF),
      fontSize: 18,
      fontWeight: FontWeight.w500,
    ),
    displayLarge: TextStyle(
      color: Colors.black,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    bodyMedium: TextStyle(
      color: Colors.black,
      fontSize: 14,
      fontWeight: FontWeight.w500,
    ),
    bodySmall: TextStyle(
      color: Colors.black,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    ),
  ),
);
