import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/globals.dart';
import 'package:united_app/src/features/authentication/screens/dashboard/dashboard_screen.dart';
import 'package:united_app/src/features/authentication/screens/signup/signup.dart';
import 'package:united_app/src/local_db/credentialsRepository.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'package:http/http.dart' as http;

class UflLoginForm extends StatefulWidget {
  const UflLoginForm({
    super.key,
  });

  @override
  State<UflLoginForm> createState() => _UflLoginFormState();
}

class _UflLoginFormState extends State<UflLoginForm> {
  var credentialsRepo = CredentialsRepository();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  String locationController = "";

  @override
  void initState() {
    credentialsRepo.getUser().then((tmpUser) {
      if (tmpUser.isNotEmpty) {
        setState(() {
          emailController.text = tmpUser[0].email;
          passwordController.text = tmpUser[0].password;
          locationController = tmpUser[0].locationId;
        });
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  ///--- Login Server
  // void handleLogin() async {
  //   http.Response response = await http.post(
  //     Uri.parse('http://192.168.1.153:3000/api/v1/login'),
  //     headers: <String, String>{
  //       'Content-Type': 'application/json; charset=UTF-8',
  //     },
  //     body: jsonEncode(<String, String>{
  //       "email": emailController.text,
  //       "password": passwordController.text,
  //       // "locationId": locationController.text
  //       "locationId": locationController
  //     }),
  //   );
  //   final data = jsonDecode(response.body);
  //   print("response: $data :: ${data['status']}");
  //   if (data['status'] == 200) {
  //     Globals.employeeId = data['employeeId'];
  //     // Globals.employeeName = ....
  //     Get.to(() => const NavigationMenu());
  //   }
  // }

  void validateLogin() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Validate email
    if (!email.endsWith('@unitedfacilities.in')) {
      Get.snackbar(
          'Error', 'Please use a valid email ending with @unitedfacilities.in',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    // Validate password
    if (password.isEmpty) {
      Get.snackbar('Error', 'Password cannot be empty',
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    http.Response response = await http.post(
      Uri.parse('http://192.168.1.7:3000/api/v1/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": emailController.text,
        "password": passwordController.text,
        // "locationId": locationController.text
        "locationId": locationController
      }),
    );
    final data = jsonDecode(response.body);
    print("response: $data :: ${data['status']}");
    if (data['status'] == 200) {
      Globals.employeeId = data['employeeId'];
      // Globals.employeeName = ....
      Get.to(() => const DashboardScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Padding(
        padding:
            const EdgeInsets.symmetric(vertical: UflSizes.spaceBtwSections),
        child: Column(
          children: [
            //   Email
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Iconsax.direct_right),
                  labelText: UflTexts.email),
            ),
            const SizedBox(height: UflSizes.spaceBtwInputFields),

            //   Password
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.password_check),
                labelText: UflTexts.password,
                suffixIcon: Icon(Iconsax.eye_slash),
              ),
              obscureText: true, // Hide password input
            ),
            const SizedBox(height: UflSizes.spaceBtwInputFields / 2),

            /// Location Dropdown
            DropdownButtonFormField<String>(
              decoration: const InputDecoration(
                labelText: 'Choose Location',
                prefixIcon: Icon(Iconsax.location),
              ),
              items: const [
                DropdownMenuItem(value: '1', child: Text('Gurugram')),
                DropdownMenuItem(value: '2', child: Text('Delhi NSP')),
                DropdownMenuItem(value: '3', child: Text('Noida')),
              ],
              onChanged: (value) {
                // Handle the selected value
                setState(() {
                  locationController = value!;
                });
              },
              validator: (value) {
                return null;

                // if (value == null || value.isEmpty) {
                //   return 'Please select a location';
                // }
                // return null;
              },
            ),
            const SizedBox(height: UflSizes.spaceBtwInputFields),

            //   Remember me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //   Remember Me
                Row(
                  children: [
                    Checkbox(value: true, onChanged: (value) {}),
                    const Text(UflTexts.rememberMe),
                  ],
                ),
              ],
            ),
            const SizedBox(height: UflSizes.spaceBtwSections),

            /// Sign In Button
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: validateLogin, // Call validateLogin on press
                    child: const Text(UflTexts.logIn))),
            const SizedBox(height: UflSizes.spaceBtwItems),

            /// Create Account Button
            // SizedBox(
            //     width: double.infinity,
            //     child: OutlinedButton(
            //         onPressed: () => Get.to(() => const SignupScreen()),
            //         child: const Text(UflTexts.createAccount))),
          ],
        ),
      ),
    );
  }
}
