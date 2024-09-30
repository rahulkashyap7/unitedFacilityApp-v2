import 'package:flutter/material.dart';
import 'package:united_app/src/utils/custom_themes/appbar_theme.dart';
import 'package:united_app/src/utils/custom_themes/bottom_sheet_theme.dart';
import 'package:united_app/src/utils/custom_themes/outlined_button_theme.dart';
import 'custom_themes/elevated_button_theme.dart';
import 'custom_themes/text_theme.dart';

class UflAppTheme {
  UflAppTheme._();

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.light,
    primaryColor: const Color(0xFFEAA040),
    textTheme: UflTextTheme.lightTextTheme,
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: UflElevatedButtonTheme.lightElevatedButtonTheme,
    appBarTheme: UflAppBarTheme.lightAppBarTheme,
    outlinedButtonTheme: UflOutlinedButtonTheme.lightOutlinedButtonTheme,
    bottomSheetTheme: UflBottomSheetTheme.lightBottomSheetTheme,
  );
  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    fontFamily: 'Poppins',
    brightness: Brightness.dark,
    primaryColor: const Color(0xFFEAA040),
    textTheme: UflTextTheme.darkTextTheme,
    scaffoldBackgroundColor: Colors.black,
    elevatedButtonTheme: UflElevatedButtonTheme.darkElevatedButtonTheme,
    appBarTheme: UflAppBarTheme.darkAppBarTheme,
    outlinedButtonTheme: UflOutlinedButtonTheme.darkOutlinedButtonTheme,
    bottomSheetTheme: UflBottomSheetTheme.darkBottomSheetTheme,
  );
}