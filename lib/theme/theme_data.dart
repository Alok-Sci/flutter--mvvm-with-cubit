import 'package:flutter/material.dart';

/// ! custom theme data
final kThemeData = ThemeData(
  primarySwatch: Colors.teal,

  /// * app bar theme
  appBarTheme: AppBarTheme(
    centerTitle: true,
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),

  /// * list tile theme
  listTileTheme: ListTileThemeData(
    tileColor: Colors.teal.withOpacity(0.1),
    iconColor: Colors.teal,
    titleTextStyle: TextStyle(
      color: Colors.teal,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    subtitleTextStyle: TextStyle(
      color: Colors.teal.withOpacity(0.7),
      fontSize: 14,
      fontWeight: FontWeight.normal,
    ),
    contentPadding: EdgeInsets.symmetric(horizontal: 20),
  ),

  /// * divider theme
  dividerTheme: DividerThemeData(
    color: Colors.teal,
  ),

  /// * fab theme
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: Colors.teal,
    foregroundColor: Colors.white,
  ),

  /// * elevated button theme
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.teal,
      foregroundColor: Colors.white,
      textStyle: TextStyle(
        color: Colors.white,
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),

  /// * text themeR
  textTheme: TextTheme(
    bodyLarge: TextStyle(
      color: Colors.teal,
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
  ),

  /// * text field theme
  inputDecorationTheme: InputDecorationTheme(
    labelStyle: TextStyle(
      color: Colors.teal,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
    hintStyle: TextStyle(
      color: Colors.teal.withOpacity(0.7),
      fontSize: 16,
      fontWeight: FontWeight.normal,
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal),
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.teal),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
      borderSide: BorderSide(
        color: Colors.teal,
        width: 2,
      ),
    ),
  ),

  /// * progress indicator theme
  progressIndicatorTheme: ProgressIndicatorThemeData(
    color: Colors.teal,
  ),

  /// * alert dialog theme
  dialogTheme: DialogTheme(
    backgroundColor: Colors.teal.shade50,
    barrierColor: Colors.black.withOpacity(0.1),
    titleTextStyle: TextStyle(
      color: Colors.teal,
      fontSize: 24,
      fontWeight: FontWeight.w700,
    ),
  ),
);
