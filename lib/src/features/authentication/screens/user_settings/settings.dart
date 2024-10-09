import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/src/common_widgets/appbar/appbar.dart';
import 'package:united_app/src/common_widgets/custom_shapes/container/primary_header_container.dart';
import 'package:united_app/src/common_widgets/list_tiles/settings_menu_tile.dart';
import 'package:united_app/src/common_widgets/texts/section_heading.dart';
import 'package:united_app/src/constants/colors.dart';
import 'package:united_app/src/features/authentication/screens/notifications/no_notifications.dart';
import 'package:united_app/src/features/authentication/screens/privacy_policy/privacy_policy.dart';
import 'package:united_app/src/features/authentication/screens/user_settings/profile_screen/profile_screen.dart';
import '../../../../common_widgets/list_tiles/user_profile_tile.dart';
import '../../../../constants/sizes.dart';
import '../login/login.dart';
import '../termAndConditions/termAndConditions.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //--- Header
          children: [
            UflPrimaryHeaderContainer(
                child: Column(
                  children: [
                    UflAppBar(
                        title: Text('Profile',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .apply(color: UflColors.white))),
                    //--- User Profile Card
                    UflProfileTile(
                        onPressed: () => Get.to(() => const ProfileScreen())),
                    const SizedBox(height: UflSizes.spaceBtwSections),
                  ],
                )),

            //---Body
            Padding(
              padding: const EdgeInsets.all(UflSizes.defaultSpace),
              child: Column(
                children: [
                  //-- Account Settings
                  const UflSectionHeading(
                      title: 'Profile Settings', showActionButton: false),
                  const SizedBox(height: UflSizes.spaceBtwItems),

                  UflSettingsMenuTile(
                      icon: Iconsax.security_user,
                      title: 'Your Profile',
                      subTitle: 'Manage and update your account details',
                      onTap: () => Get.to(() => const ProfileScreen())),
                  UflSettingsMenuTile(
                      icon: Iconsax.document,
                      title: 'Term & Conditions',
                      subTitle: 'Read company T&Cs',
                      onTap: () => Get.to(() => const TermAndconditions())),
                  UflSettingsMenuTile(
                    icon: Iconsax.notification,
                    title: 'Notifications',
                    subTitle: 'View any kind of notification message',
                    onTap: () => Get.to(() => const NoNotifications()),
                  ),
                  UflSettingsMenuTile(
                    icon: Iconsax.shield_tick,
                    title: 'Privacy Policy',
                    subTitle: 'Manage data usage and connected account',
                    onTap: () => Get.to(() => const PrivacyPolicy()),
                  ),

                  //--- App Settings
                  const SizedBox(height: UflSizes.spaceBtwSections),
                  const UflSectionHeading(
                      title: 'App Settings', showActionButton: false),
                  const SizedBox(height: UflSizes.spaceBtwItems),
                  UflSettingsMenuTile(
                    icon: Iconsax.document_upload,
                    title: 'Upload your document',
                    subTitle: 'Upload Data to your Cloud Firebase',
                    onTap: () {},
                  ),
                  UflSettingsMenuTile(
                    icon: Iconsax.location,
                    title: 'Geolocation',
                    subTitle: 'Protect your location from third party apps',
                    trailing: Switch(value: true, onChanged: (value) {}),
                    onTap: () {},
                  ),

                  //--- Logout Button
                  const SizedBox(height: UflSizes.spaceBtwSections),
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () => _showLogoutConfirmation(context),
                      child: const Text('Logout'),
                    ),
                  ),
                  const SizedBox(height: UflSizes.spaceBtwSections * 2.5),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Function to show the logout confirmation dialog
  void _showLogoutConfirmation(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Are you sure?"),
          content: const Text("Do you really want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
              },
              child: const Text("No"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();  // Close the dialog
                Get.offAll(() => const LoginScreen());  // Navigate to LoginScreen and remove all previous routes
              },
              child: const Text("Yes"),
            ),
          ],
        );
      },
    );
  }
}
