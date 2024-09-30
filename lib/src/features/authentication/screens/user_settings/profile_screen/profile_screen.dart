import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/src/common_widgets/appbar/appbar.dart';
import 'package:united_app/src/common_widgets/texts/section_heading.dart';
import 'package:united_app/src/constants/sizes.dart';
import 'package:united_app/src/features/authentication/screens/user_settings/profile_screen/widget/profile_menu.dart';
import '../../../../../common_widgets/images/ufl_rounded_image.dart';
import '../../../../../constants/image_strings.dart';
import '../settings.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UflAppBar(
        showBackArrow: true,
        title: Text('Profile'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(UflSizes.defaultSpace),
        child: Column(
          children: [
            //--- Profile Picture
            SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  const UflRoundedImage(imageUrl: UflImages.userPic, width: 80, height: 80),
                  TextButton(onPressed: (){}, child: const Text('Change Profile Picture')),
                ],
              ),
            ),

            //--- Details
            const SizedBox(height: UflSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: UflSizes.spaceBtwItems),

            //--- Heading Profile Info
            const UflSectionHeading(title: 'Profile Information', showActionButton: false),
            const SizedBox(height: UflSizes.spaceBtwItems),

            UflProfileMenu(onPressed: () {}, title: 'Name', value: 'User'),
            UflProfileMenu(onPressed: () {}, title: 'Employee ID', value: 'U105456', icon: Iconsax.copy,),

            const SizedBox(height: UflSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: UflSizes.spaceBtwItems),

            //--- Heading Personal Info
            const UflSectionHeading(title: 'Personal Information', showActionButton: false),
            const SizedBox(height: UflSizes.spaceBtwItems),

            UflProfileMenu(onPressed: (){}, title: 'E-mail', value: 'user@unitedfacilities.in'),
            UflProfileMenu(onPressed: (){}, title: 'Date Of Birth', value: '1 Jan, 2000'),
            UflProfileMenu(onPressed: (){}, title: 'Department', value: 'Operations'),
            UflProfileMenu(onPressed: (){}, title: 'Position', value: 'Operation Executive'),
            UflProfileMenu(onPressed: (){}, title: 'Gender', value: 'Male'),
            UflProfileMenu(onPressed: (){}, title: 'Location', value: 'NSP Delhi'),
            const Divider(),
            const SizedBox(height: UflSizes.spaceBtwItems),

            Center(
              child: TextButton(onPressed: () => Get.to(() => const SettingsScreen()), child: const Text('Close Account', style: TextStyle(color: Colors.red)),
              ),
            )



          ],
        ),
      ),
    );
  }
}

