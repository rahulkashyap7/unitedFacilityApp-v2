import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/src/constants/colors.dart';
import 'package:united_app/src/features/authentication/screens/dashboard/dashboard_screen.dart';
import 'package:united_app/src/features/authentication/screens/user_settings/settings.dart';
import 'package:united_app/src/utils/helpers/helper_functions.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    final darkMode = UflHelperFunction.isDarkMode(context);

    return Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) => controller.selectedIndex.value = index,
          backgroundColor: darkMode ? UflColors.black : Colors.white,
          indicatorColor: darkMode ? UflColors.white.withOpacity(0.1) : UflColors.black.withOpacity(0.1),
          destinations: const [
           NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
           NavigationDestination(icon: Icon(Iconsax.calendar_1), label: 'Calendar'),
           NavigationDestination(icon: Icon(Iconsax.document_text), label: 'Leave'),
           NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}


class NavigationController extends GetxController{
  final Rx<int>selectedIndex = 0.obs;


  final screens = [const DashboardScreen(), Container(color: Colors.orange), Container(color: Colors.purple), const SettingsScreen()];
}