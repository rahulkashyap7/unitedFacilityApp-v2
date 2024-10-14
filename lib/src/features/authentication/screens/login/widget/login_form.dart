import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:united_app/globals.dart';
import 'package:united_app/src/features/authentication/screens/dashboard/dashboard_screen.dart';
import 'package:united_app/src/local_db/credentialsRepository.dart';
import 'package:united_app/src/utils/helpers/helper_functions.dart';
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

  bool _isPasswordVisible = false; // Add this line

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
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

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

    print("comming to login.. ${Globals.baseUrl}");

    http.Response response = await http.post(
      Uri.parse('${Globals.baseUrl}/login'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode({
        "email": emailController.text.trim(),
        "password": passwordController.text.trim(),
        "locationId": locationController,
      }),
    );
    final data = jsonDecode(response.body);
    print("response: $data :: ${data['data']}");
    if (data['status'] == 200) {
      var employeeId = data['data']['employeeId'];
      var employeeName = data['data']['fullname'];
      var employeeEmail = data['data']['email'];
      var empLocation =
          UflHelperFunction.getLocationFromId(data['data']['locationId']);

      Globals.employeeId = data['data']['employeeId'];
      Globals.employeeName = data['data']['fullname'];
      Globals.employeeEmail = data['data']['email'];
      Globals.empLocation =
          UflHelperFunction.getLocationFromId(data['data']['locationId']);


      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setBool("isLogined", true);
      await prefs.setString("employeeId", employeeId);
      await prefs.setString("employeeName", employeeName);
      await prefs.setString("employeeEmail", employeeEmail);
      await prefs.setString("employeeLoc", empLocation);

      Get.to(() => const DashboardScreen());
    } else if (data['status']==401){
      Get.snackbar(
          'Error', data['msg'],
          snackPosition: SnackPosition.BOTTOM);
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
              decoration: InputDecoration(
                prefixIcon: const Icon(Iconsax.password_check),
                labelText: UflTexts.password,
                suffixIcon: IconButton(
                  // Change this line
                  icon: Icon(
                    _isPasswordVisible
                        ? Iconsax.eye
                        : Iconsax.eye_slash, // Toggle icon
                  ),
                  onPressed: () {
                    setState(() {
                      _isPasswordVisible =
                          !_isPasswordVisible; // Toggle visibility
                    });
                  },
                ),
              ),
              obscureText: !_isPasswordVisible, // Use the state variable
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
                    Checkbox(
                        value: true,
                        onChanged:
                            (value) {}), // When user click checkbox change
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
          ],
        ),
      ),
    );
  }
}
