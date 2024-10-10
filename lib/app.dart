import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_app/globals.dart';
import 'package:united_app/src/features/authentication/screens/dashboard/dashboard_screen.dart';
import 'package:united_app/src/features/authentication/screens/on_boarding/onboarding_screen.dart';
import 'package:united_app/src/utils/theme.dart';

class UflApp extends StatefulWidget {
  const UflApp({super.key});

  @override
  State<UflApp> createState() => _UflAppState();
}

class _UflAppState extends State<UflApp> {
  bool isLogined = false;

  void setLoginState() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    var loginState = prefs.getBool("isLogined");

    if (loginState==true) {
      Globals.employeeId = prefs.getString("employeeId")! ;
      Globals.employeeName = prefs.getString("employeeName")!;
      Globals.employeeEmail = prefs.getString("employeeEmail")!;
      Globals.empLocation = prefs.getString("employeeLoc")!;
    }

    setState(() {
      if (loginState!=null) {
        isLogined = loginState;
      }
    });
  }

  @override
  void initState() {
    setLoginState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.system,
      theme: UflAppTheme.lightTheme,
      darkTheme: UflAppTheme.darkTheme,
      home: isLogined ? const DashboardScreen() : const OnBoardingScreen(),
    );
  }
}

// final SharedPreferences prefs = await SharedPreferences.getInstance();
// await prefs.setBool("isLogined", true);
