import 'dart:collection';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_app/globals.dart';
import 'package:united_app/src/common_widgets/appbar/appbar.dart';
import 'package:united_app/src/common_widgets/texts/section_heading.dart';
import 'package:united_app/src/constants/sizes.dart';
import 'package:united_app/src/features/authentication/screens/user_settings/profile_screen/widget/profile_menu.dart';
import 'package:iconsax/iconsax.dart';
import '../settings.dart';
import 'package:http/http.dart' as http;

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final Map<String, String> userInfo = HashMap();

  void fetchUserData() async {
    String url = "${Globals.baseUrl}/profile?id=${Globals.employeeId}";
    print("url: $url");
    http.Response response = await http.get(
        Uri.parse('${Globals.baseUrl}/profile?id=${Globals.employeeId}'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        });
    final data = jsonDecode(response.body);
    print("response in profile: $data :: ${data['data']}");
    if (data['status'] == 200) {
      setState(() {
        userInfo['name'] = data['data']['fullname'];
        userInfo['email'] = data['data']['email'];
        userInfo['dob'] = data['data']['dob'];
        userInfo['department'] = data['data']['department'];
        userInfo['position'] = data['data']['designation'];
        userInfo['gender'] = data['data']['gender'];
        userInfo['location'] = 'NSP'; // TODO from DB
      });
    }
  }

  @override
  void initState() {
    userInfo['name'] = "";
    userInfo['email'] = "";
    userInfo['dob'] = "";
    userInfo['department'] = "";
    userInfo['position'] = "";
    userInfo['gender'] = "";
    userInfo['location'] = ''; // TODO from DB

    fetchUserData();
    super.initState();
  }

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
            const SizedBox(
              width: double.infinity,
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40, // Adjust the radius as needed
                    backgroundColor:
                        Colors.grey, // Background color for the icon
                    child: Icon(
                      Iconsax.user, // User circle icon
                      color: Colors.white,
                      size: 40, // Adjust size as needed
                    ),
                  ),
                ],
              ),
            ),

            //--- Details
            const SizedBox(height: UflSizes.spaceBtwItems / 2),
            const Divider(),
            const SizedBox(height: UflSizes.spaceBtwItems),

            //--- Heading Profile Info
            const UflSectionHeading(
                title: 'Profile Information', showActionButton: false),
            const SizedBox(height: UflSizes.spaceBtwItems),

            UflProfileMenu(
                onPressed: () {}, title: 'Name', value: userInfo['name']!),
            UflProfileMenu(
              onPressed: () {},
              title: 'Employee ID',
              value: Globals.employeeId,
            ),

            const SizedBox(height: UflSizes.spaceBtwItems),
            const Divider(),
            const SizedBox(height: UflSizes.spaceBtwItems),

            //--- Heading Personal Info
            const UflSectionHeading(
                title: 'Personal Information', showActionButton: false),
            const SizedBox(height: UflSizes.spaceBtwItems),

            UflProfileMenu(
                onPressed: () {}, title: 'E-mail', value: userInfo['email']!),
            UflProfileMenu(
                onPressed: () {}, title: 'Date Of Birth', value: userInfo['dob']!),
            UflProfileMenu(
                onPressed: () {},
                title: 'Department',
                value: userInfo['department']!),
            UflProfileMenu(
                onPressed: () {},
                title: 'Position',
                value: userInfo['position']!),
            UflProfileMenu(
                onPressed: () {}, title: 'Gender', value: userInfo['gender']!),
            UflProfileMenu(
                onPressed: () {},
                title: 'Location',
                value: Globals.empLocation),
            const Divider(),
            const SizedBox(height: UflSizes.spaceBtwItems),

            Center(
              child: TextButton(
                onPressed: () => Get.to(() => const SettingsScreen()),
                child: const Text('Close Account',
                    style: TextStyle(color: Colors.red)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
