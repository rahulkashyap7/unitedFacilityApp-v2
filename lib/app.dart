import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_app/globals.dart';
import 'package:united_app/src/features/authentication/screens/on_boarding/onboarding_screen.dart';
import 'package:united_app/src/utils/theme.dart';

class UflApp extends StatelessWidget {
  const UflApp({super.key});

  @override
  Widget build(BuildContext context) {

    Globals.employeeId = 19918;

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UflAppTheme.lightTheme,
      darkTheme: UflAppTheme.darkTheme,
      home: const OnBoardingScreen(),
    );
  }
}

