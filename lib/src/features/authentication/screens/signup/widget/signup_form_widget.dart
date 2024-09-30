import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:united_app/src/features/authentication/screens/signup/verify_email.dart';
import 'package:united_app/src/features/authentication/screens/signup/widget/terms_conditions_checkbox.dart';
import '../../../../../constants/sizes.dart';
import '../../../../../constants/text_strings.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../../../local_db/credentialsRepository.dart';

class UflSignupForm extends StatefulWidget {
  const UflSignupForm({
    super.key,
  });

  @override
  State<UflSignupForm> createState() => _UflSignupFormState();
}

class _UflSignupFormState extends State<UflSignupForm> {
  var credentialsRepo = CredentialsRepository();

  final fullNameController = TextEditingController();
  final employeeIdController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  String locationController = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    fullNameController.dispose();
    employeeIdController.dispose();
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  void handleCreateAccount() async {
    print('''
                Fullname: ${fullNameController.text}\n
                EmpId: ${employeeIdController.text}\n
                loc: $locationController\n
                em: ${emailController.text}\n
                pass: ${passwordController.text}
                ''');

    http.Response response = await http.post(
      Uri.parse('http://192.168.1.153:3000/api/v1/signup'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        "email": emailController.text,
        "password": passwordController.text,
        "fullname": fullNameController.text,
        // "locationId": locationController.text
        "locationId": locationController
      }),
    );

    print("response: ${response.body}");
    final data = jsonDecode(response.body);
    if (data['status'] == 200) {
      User user = User(
        id: 1,
          email: emailController.text,
          password: passwordController.text,
          locationId: locationController);
      await credentialsRepo.addUser(user);
      Get.to(() => const VerifyEmailScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        Row(
          children: [
            Expanded(
              child: TextFormField(
                controller: fullNameController,
                expands: false,
                decoration: const InputDecoration(
                    labelText: UflTexts.firstName,
                    prefixIcon: Icon(Iconsax.user)),
              ),
            ),
            const SizedBox(width: UflSizes.spaceBtwInputFields),
          ],
        ),
        const SizedBox(height: UflSizes.spaceBtwInputFields),

        /// Employee Id
        TextFormField(
          controller: employeeIdController,
          expands: false,
          decoration: const InputDecoration(
              labelText: UflTexts.empId, prefixIcon: Icon(Iconsax.user_edit)),
        ),

        const SizedBox(height: UflSizes.spaceBtwInputFields),

        /// Location Dropdown
        DropdownButtonFormField<String>(
          decoration: const InputDecoration(
            labelText: 'Choose Location',
            prefixIcon: Icon(Iconsax.location),
          ),
          items: const [
            DropdownMenuItem(value: "1", child: Text('Gurugram')),
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

            // if (value!.isEmpty) {
            //   return 'Please select a location';
            // }
            // return null;
          },
        ),
        const SizedBox(height: UflSizes.spaceBtwInputFields),

        /// Email
        TextFormField(
          controller: emailController,
          expands: false,
          decoration: const InputDecoration(
              labelText: UflTexts.email,
              prefixIcon: Icon(Iconsax.direct_right)),
        ),

        const SizedBox(height: UflSizes.spaceBtwInputFields),

        /// Password
        TextFormField(
          controller: passwordController,
          obscureText: true,
          decoration: const InputDecoration(
              labelText: UflTexts.password,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(height: UflSizes.spaceBtwInputFields),

        /// Confirm Password
        TextFormField(
          obscureText: true,
          decoration: const InputDecoration(
              labelText: UflTexts.confirmPassword,
              prefixIcon: Icon(Iconsax.password_check),
              suffixIcon: Icon(Iconsax.eye_slash)),
        ),
        const SizedBox(height: UflSizes.spaceBtwInputFields),

        /// Terms&Condition Checkbox
        const UflTermsAndConditionCheckbox(),
        const SizedBox(height: UflSizes.spaceBtwSections),

        /// create account Button
        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
              onPressed: handleCreateAccount,
              child: const Text(UflTexts.createAccount)),
        )
      ],
    ));
  }
}
