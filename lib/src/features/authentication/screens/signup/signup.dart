import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:united_app/src/constants/sizes.dart';
import 'package:united_app/src/constants/text_strings.dart';
import 'package:united_app/src/features/authentication/screens/login/widget/login_divider.dart';
import 'package:united_app/src/features/authentication/screens/login/widget/login_social_icon.dart';
import 'package:united_app/src/features/authentication/screens/signup/widget/signup_form_widget.dart';
import '../../../../constants/image_strings.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(UflSizes.defaultSpace),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Image(
                height: 85,
                image: AssetImage(UflImages.lightLoginLogo),
              ),
              /// title
              Text(UflTexts.signupTitle,
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: UflSizes.spaceBtwSections),
              Text(UflTexts.signupSubTitle,
                  style: Theme.of(context).textTheme.bodyMedium),
              const SizedBox(height: UflSizes.spaceBtwSections),

              ///Form
              const UflSignupForm(),
              const SizedBox(height: UflSizes.spaceBtwSections),

              ///Divider
              UflDivider(dividerText: UflTexts.orSignUpWith.capitalize!),
              const SizedBox(height: UflSizes.spaceBtwSections),

              /// Social Icon
              const UflSocialButton(),
            ],
          ),
        ),
      ),
    );
  }
}


